#!/data/data/com.termux/files/usr/bin/bash
set -u

RLS_DIR="$HOME/02.ERP-system/52.master-data/930.implementation-prep-freeze/040.rls-auth"
RLS_SQL="$RLS_DIR/042_RLS_POLICY_PROPOSAL_DRAFT.sql"
REPORT="$RLS_DIR/046_RLS_LINT_READONLY_PRECHECK_REPORT.md"

PASS_COUNT=0
WARN_COUNT=0
FAIL_COUNT=0

pass() {
  PASS_COUNT=$((PASS_COUNT + 1))
  printf 'PASS: %s\n' "$1" >> "$REPORT"
}

warn() {
  WARN_COUNT=$((WARN_COUNT + 1))
  printf 'WARN: %s\n' "$1" >> "$REPORT"
}

fail() {
  FAIL_COUNT=$((FAIL_COUNT + 1))
  printf 'FAIL: %s\n' "$1" >> "$REPORT"
}

check_file() {
  if [ -f "$1" ]; then
    pass "file exists: $1"
  else
    fail "file missing: $1"
  fi
}

check_term() {
  local term="$1"
  local label="$2"
  if grep -q "$term" "$RLS_SQL" 2>/dev/null; then
    pass "$label"
  else
    fail "$label"
  fi
}

check_absent_ci() {
  local term="$1"
  local label="$2"
  if grep -Eiq "$term" "$RLS_SQL" 2>/dev/null; then
    fail "$label"
  else
    pass "$label"
  fi
}

{
  printf '%s\n' '# ============================================================'
  printf '%s\n' '# 52.master-data RLS LINT READONLY PRECHECK REPORT'
  printf '%s\n' '# ============================================================'
  printf 'generated_at: %s\n' "$(date '+%Y-%m-%d %H:%M:%S %z')"
  printf 'rls_sql: %s\n' "$RLS_SQL"
  printf 'db_apply_status: STOPPED\n'
  printf 'psql_executed: NO\n'
  printf '%s\n' ''
  printf '%s\n' '## 1. File existence'
} > "$REPORT"

check_file "$RLS_SQL"
check_file "$RLS_DIR/041_RLS_POLICY_PROPOSAL_DRAFT_INDEX.md"
check_file "$RLS_DIR/043_RLS_POLICY_TO_API_PERMISSION_MATRIX.md"
check_file "$RLS_DIR/044_RLS_POLICY_REVIEW_CHECKLIST.md"
check_file "$RLS_DIR/047_RLS_APPLY_STOP_GATE.md"

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## 2. STOP / review terms' >> "$REPORT"

if [ -f "$RLS_SQL" ]; then
  check_term "DO NOT RUN THIS FILE YET" "RLS SQL contains DO NOT RUN warning"
  check_term "db_apply_status: STOPPED" "RLS SQL contains STOPPED status"
  check_term "佐藤" "RLS SQL contains Sato review requirement"
  check_term "psql \"\$DATABASE_URL\"" "RLS SQL contains future DATABASE_URL psql format"
fi

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## 3. Required helper functions' >> "$REPORT"

if [ -f "$RLS_SQL" ]; then
  for term in \
    "fn_rls_company_id" \
    "fn_rls_actor_id" \
    "fn_rls_source_module" \
    "fn_rls_has_permission"
  do
    check_term "$term" "helper exists: $term"
  done
fi

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## 4. Required RLS terms' >> "$REPORT"

if [ -f "$RLS_SQL" ]; then
  for term in \
    "enable row level security" \
    "create policy" \
    "for select" \
    "for insert" \
    "for update" \
    "with check" \
    "company_id = master_data.fn_rls_company_id" \
    "master.publication.acknowledge" \
    "master.impact_review.create" \
    "master.BI_snapshot.read" \
    "master.audit.read"
  do
    check_term "$term" "RLS term exists: $term"
  done
fi

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## 5. Unsafe SQL absence check' >> "$REPORT"

if [ -f "$RLS_SQL" ]; then
  check_absent_ci 'drop[[:space:]]+schema' "no DROP SCHEMA"
  check_absent_ci 'drop[[:space:]]+table' "no DROP TABLE"
  check_absent_ci 'truncate[[:space:]]+table' "no TRUNCATE TABLE"
  check_absent_ci 'delete[[:space:]]+from' "no DELETE FROM"
  check_absent_ci 'alter[[:space:]]+table.*drop[[:space:]]+column' "no ALTER TABLE DROP COLUMN"
  check_absent_ci 'grant[[:space:]]+.*service_role' "no service_role grant"
  check_absent_ci 'password|secret_key|api_key|credential_value' "no secret-like value terms"
fi

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## 6. Count summary' >> "$REPORT"

if [ -f "$RLS_SQL" ]; then
  HELPER_COUNT="$(grep -Ei '^[[:space:]]*create or replace function master_data\.fn_rls_' "$RLS_SQL" | wc -l | tr -d ' ')"
  ENABLE_COUNT="$(grep -Ei 'enable row level security' "$RLS_SQL" | wc -l | tr -d ' ')"
  POLICY_COUNT="$(grep -Ei '^[[:space:]]*create policy ' "$RLS_SQL" | wc -l | tr -d ' ')"

  printf 'HELPER_COUNT=%s\n' "$HELPER_COUNT" >> "$REPORT"
  printf 'ENABLE_RLS_COUNT=%s\n' "$ENABLE_COUNT" >> "$REPORT"
  printf 'POLICY_COUNT=%s\n' "$POLICY_COUNT" >> "$REPORT"

  if [ "$HELPER_COUNT" -ge 4 ]; then
    pass "helper count is plausible"
  else
    warn "helper count may be low"
  fi

  if [ "$ENABLE_COUNT" -ge 10 ]; then
    pass "RLS enable count is plausible"
  else
    warn "RLS enable count may be low"
  fi

  if [ "$POLICY_COUNT" -ge 15 ]; then
    pass "policy count is plausible"
  else
    warn "policy count may be low"
  fi
fi

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## 7. Summary' >> "$REPORT"
printf 'PASS_COUNT=%s\n' "$PASS_COUNT" >> "$REPORT"
printf 'WARN_COUNT=%s\n' "$WARN_COUNT" >> "$REPORT"
printf 'FAIL_COUNT=%s\n' "$FAIL_COUNT" >> "$REPORT"

if [ "$FAIL_COUNT" -eq 0 ]; then
  printf '%s\n' 'FINAL_RESULT=PASS_READONLY_RLS_LINT' >> "$REPORT"
else
  printf '%s\n' 'FINAL_RESULT=REVIEW_REQUIRED' >> "$REPORT"
fi

printf '%s\n' '============================================================'
printf '%s\n' '52.master-data RLS LINT READONLY PRECHECK DONE'
printf '%s\n' '============================================================'
printf 'REPORT=%s\n' "$REPORT"
printf 'PASS_COUNT=%s\n' "$PASS_COUNT"
printf 'WARN_COUNT=%s\n' "$WARN_COUNT"
printf 'FAIL_COUNT=%s\n' "$FAIL_COUNT"
if [ "$FAIL_COUNT" -eq 0 ]; then
  printf '%s\n' 'FINAL_RESULT=PASS_READONLY_RLS_LINT'
else
  printf '%s\n' 'FINAL_RESULT=REVIEW_REQUIRED'
fi
printf '%s\n' 'DB_APPLY_STATUS=STOPPED'
printf '%s\n' 'PSQL_EXECUTED=NO'
printf '%s\n' '============================================================'
