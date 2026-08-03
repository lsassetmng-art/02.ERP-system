#!/data/data/com.termux/files/usr/bin/bash
set -u

DB_DIR="$HOME/02.ERP-system/52.master-data/930.implementation-prep-freeze/030.db"
DDL="$DB_DIR/032_DB_DDL_PROPOSAL_DRAFT.sql"
REPORT="$DB_DIR/039_DDL_LINT_READONLY_PRECHECK_REPORT.md"

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
  if grep -q "$term" "$DDL" 2>/dev/null; then
    pass "$label"
  else
    fail "$label"
  fi
}

check_absent_ci() {
  local term="$1"
  local label="$2"
  if grep -Eiq "$term" "$DDL" 2>/dev/null; then
    fail "$label"
  else
    pass "$label"
  fi
}

{
  printf '%s\n' '# ============================================================'
  printf '%s\n' '# 52.master-data DDL LINT READONLY PRECHECK REPORT'
  printf '%s\n' '# ============================================================'
  printf 'generated_at: %s\n' "$(date '+%Y-%m-%d %H:%M:%S %z')"
  printf 'ddl: %s\n' "$DDL"
  printf 'db_apply_status: STOPPED\n'
  printf 'psql_executed: NO\n'
  printf '%s\n' ''
  printf '%s\n' '## 1. File existence'
} > "$REPORT"

check_file "$DDL"
check_file "$DB_DIR/031_DB_DDL_PROPOSAL_DRAFT_INDEX.md"
check_file "$DB_DIR/033_DB_OBJECT_MAPPING_TO_API_PAYLOADS.md"
check_file "$DB_DIR/034_DB_PRECHECK_AND_APPLY_STOP_GATE.md"
check_file "$DB_DIR/035_DB_DDL_PROPOSAL_REVIEW_CHECKLIST.md"
check_file "$DB_DIR/037_SATO_DB_REVIEW_READONLY_CHECKLIST.md"

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## 2. Required STOP / review terms' >> "$REPORT"

if [ -f "$DDL" ]; then
  check_term "DO NOT RUN THIS FILE YET" "DDL contains DO NOT RUN warning"
  check_term "db_apply_status: STOPPED" "DDL contains STOPPED status"
  check_term "Future apply requires 佐藤" "DDL contains Sato review requirement"
  check_term "psql \"\$DATABASE_URL\"" "DDL contains future DATABASE_URL psql format"
  check_term "create schema if not exists master_data" "DDL contains master_data schema proposal"
  check_term "create extension if not exists pgcrypto" "DDL contains pgcrypto proposal"
fi

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## 3. Required core objects' >> "$REPORT"

if [ -f "$DDL" ]; then
  for obj in \
    "master_data.master_record" \
    "master_data.master_record_version" \
    "master_data.master_identifier" \
    "master_data.master_role_assignment" \
    "master_data.master_publication_package" \
    "master_data.master_publication_line" \
    "master_data.master_consumer_acknowledgement" \
    "master_data.master_impact_review" \
    "master_data.source_extension_owner_matrix" \
    "master_data.business_partner_core" \
    "master_data.customer_core" \
    "master_data.supplier_core" \
    "master_data.item_core" \
    "master_data.product_core" \
    "master_data.unit_of_measure" \
    "master_data.location_core" \
    "master_data.company_reference" \
    "master_data.legal_entity_reference" \
    "master_data.organization_unit_reference" \
    "master_data.vw_active_master_record" \
    "master_data.vw_master_publication_status" \
    "master_data.vw_module_master_reference_directory" \
    "master_data.vw_bi_master_dimension_snapshot"
  do
    check_term "$obj" "required object exists in DDL: $obj"
  done
fi

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## 4. Destructive / unsafe SQL absence check' >> "$REPORT"

if [ -f "$DDL" ]; then
  check_absent_ci 'drop[[:space:]]+schema' "no DROP SCHEMA"
  check_absent_ci 'drop[[:space:]]+table' "no DROP TABLE"
  check_absent_ci 'truncate[[:space:]]+table' "no TRUNCATE TABLE"
  check_absent_ci 'delete[[:space:]]+from' "no DELETE FROM"
  check_absent_ci 'alter[[:space:]]+table.*drop[[:space:]]+column' "no ALTER TABLE DROP COLUMN"
  check_absent_ci 'drop[[:space:]]+database' "no DROP DATABASE"
  check_absent_ci 'create[[:space:]]+database' "no CREATE DATABASE"
  check_absent_ci 'grant[[:space:]]+.*service_role' "no service_role grant"
  check_absent_ci 'password|secret_key|api_key|credential_value' "no secret-like value terms"
fi

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## 5. Object count summary' >> "$REPORT"

if [ -f "$DDL" ]; then
  TABLE_COUNT="$(grep -Ei '^[[:space:]]*create table if not exists master_data\.' "$DDL" | wc -l | tr -d ' ')"
  INDEX_COUNT="$(grep -Ei '^[[:space:]]*create (unique )?index if not exists ' "$DDL" | wc -l | tr -d ' ')"
  VIEW_COUNT="$(grep -Ei '^[[:space:]]*create or replace view master_data\.' "$DDL" | wc -l | tr -d ' ')"
  FUNCTION_COUNT="$(grep -Ei '^[[:space:]]*create or replace function master_data\.' "$DDL" | wc -l | tr -d ' ')"
  TRIGGER_COUNT="$(grep -Ei '^[[:space:]]*create trigger ' "$DDL" | wc -l | tr -d ' ')"

  printf 'TABLE_COUNT=%s\n' "$TABLE_COUNT" >> "$REPORT"
  printf 'INDEX_COUNT=%s\n' "$INDEX_COUNT" >> "$REPORT"
  printf 'VIEW_COUNT=%s\n' "$VIEW_COUNT" >> "$REPORT"
  printf 'FUNCTION_COUNT=%s\n' "$FUNCTION_COUNT" >> "$REPORT"
  printf 'TRIGGER_COUNT=%s\n' "$TRIGGER_COUNT" >> "$REPORT"

  if [ "$TABLE_COUNT" -ge 15 ]; then
    pass "table count is plausible"
  else
    warn "table count may be low"
  fi

  if [ "$VIEW_COUNT" -ge 4 ]; then
    pass "view count is plausible"
  else
    warn "view count may be low"
  fi

  if [ "$FUNCTION_COUNT" -ge 1 ]; then
    pass "function count is plausible"
  else
    warn "function count may be low"
  fi
fi

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## 6. Boundary checks' >> "$REPORT"

if [ -f "$DDL" ]; then
  check_absent_ci 'sales_order|purchase_order|customer_invoice|supplier_invoice|gl_journal|stock_ledger|payroll_calculation|production_order' "no obvious transaction table names in master_data DDL"
  check_term "lineage_reference" "lineage_reference appears"
  check_term "company_id" "company_id appears"
  check_term "effective_from" "effective_from appears"
  check_term "effective_to" "effective_to appears"
fi

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## 7. Summary' >> "$REPORT"
printf 'PASS_COUNT=%s\n' "$PASS_COUNT" >> "$REPORT"
printf 'WARN_COUNT=%s\n' "$WARN_COUNT" >> "$REPORT"
printf 'FAIL_COUNT=%s\n' "$FAIL_COUNT" >> "$REPORT"

if [ "$FAIL_COUNT" -eq 0 ]; then
  printf '%s\n' 'FINAL_RESULT=PASS_READONLY_LINT' >> "$REPORT"
else
  printf '%s\n' 'FINAL_RESULT=REVIEW_REQUIRED' >> "$REPORT"
fi

printf '%s\n' '============================================================'
printf '%s\n' '52.master-data DDL LINT READONLY PRECHECK DONE'
printf '%s\n' '============================================================'
printf 'REPORT=%s\n' "$REPORT"
printf 'PASS_COUNT=%s\n' "$PASS_COUNT"
printf 'WARN_COUNT=%s\n' "$WARN_COUNT"
printf 'FAIL_COUNT=%s\n' "$FAIL_COUNT"
if [ "$FAIL_COUNT" -eq 0 ]; then
  printf '%s\n' 'FINAL_RESULT=PASS_READONLY_LINT'
else
  printf '%s\n' 'FINAL_RESULT=REVIEW_REQUIRED'
fi
printf '%s\n' 'DB_APPLY_STATUS=STOPPED'
printf '%s\n' 'PSQL_EXECUTED=NO'
printf '%s\n' '============================================================'
