# ============================================================
# DB PRECHECK AND APPLY STOP GATE
# 52.master-data DDL proposal
# ============================================================

status: STOP
owner: Boss
prepared_by: Zero
module: 52.master-data
db_apply_status: STOPPED
db_env_later: DATABASE_URL
review_required:
- 佐藤（DB担当）

# ============================================================
# 1. STOP
# ============================================================

DB_APPLY_STOP:
- Do not run 032_DB_DDL_PROPOSAL_DRAFT.sql yet.
- Do not apply schema.
- Do not create tables.
- Do not create views.
- Do not create functions.
- Do not enable RLS.
- Do not insert seed data.

# ============================================================
# 2. FUTURE PRECHECK REQUIREMENTS
# ============================================================

future_precheck_requirements:
- confirm DATABASE_URL is set
- confirm target DB is ERP database
- confirm no conflicting schema/table names
- confirm no existing master_data schema mismatch
- confirm pgcrypto extension availability
- confirm role/permission assumptions
- confirm backup/rollback plan
- confirm 佐藤（DB担当） review
- confirm explicit user approval

# ============================================================
# 3. FUTURE APPLY FORMAT
# ============================================================

future_apply_format:
- Termux direct paste
- psql "$DATABASE_URL" only
- no PGHOST/PGUSER/PGPASSWORD individual env assumption
- no unset DATABASE_URL
- no /tmp usage
- use $HOME/.tmp if temporary files are needed

# ============================================================
# 4. FUTURE APPLY GATE
# ============================================================

future_apply_gate:
- Gate 1: DDL proposal review PASS
- Gate 2: read-only precheck PASS
- Gate 3: user says apply explicitly
- Gate 4: 佐藤（DB担当） approves
- Gate 5: apply one-block generated
- Gate 6: rollback smoke PASS
- Gate 7: read-only verification PASS

# ============================================================
