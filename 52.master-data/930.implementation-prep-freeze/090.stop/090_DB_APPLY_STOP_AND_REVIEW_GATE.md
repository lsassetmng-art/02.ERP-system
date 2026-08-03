# ============================================================
# DB APPLY STOP AND REVIEW GATE
# 52.master-data implementation-prep freeze
# ============================================================

status: STOP
owner: Boss
prepared_by: Zero
module: 52.master-data
db_env_later: DATABASE_URL
review_required:
- 佐藤（DB担当）

# ============================================================
# 1. STOP DECLARATION
# ============================================================

DB_APPLY_STOP:
- Do not apply DB DDL from this implementation-prep freeze.
- Do not run psql apply.
- Do not create schema/tables/views/functions yet.
- Do not change RLS yet.
- Do not insert seed data yet.
- This freeze is design/prep only.

# ============================================================
# 2. FUTURE DB APPLY REQUIREMENTS
# ============================================================

future_db_apply_requirements:
- explicit user approval
- 佐藤（DB担当） review
- read-only precheck
- DDL proposal file
- rollback plan
- Termux one-block
- psql "$DATABASE_URL" only
- no PG* individual env var assumption
- no unset of DATABASE_URL
- additive-only
- no destructive migration
- smoke test
- final report

# ============================================================
# 3. FUTURE SQL FORMAT
# ============================================================

future_sql_format_required:
- psql "$DATABASE_URL" <<'SQL'
- SQL
- Termux direct paste
- cd-position independent
- no /tmp usage
- use $HOME/.tmp if temporary files are needed

# ============================================================
# 4. COMPLETION STATE
# ============================================================

completion_state:
- DB apply is explicitly stopped.
- Review gate is fixed.
- Next step may prepare DDL proposal only, not apply.

# ============================================================
