# ============================================================
# 52.master-data READ-ONLY DB PRECHECK INDEX
# ============================================================

status: active
owner: Boss
prepared_by: Zero
generated_at: 2026-05-15 06:03:39 +0900
module: 52.master-data
phase: readonly-db-precheck
db_apply_status: STOPPED
psql_mode: READ_ONLY_SELECT_ONLY
sql_file:
- /data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/080.readonly-db-precheck/080_READONLY_DB_PRECHECK.sql

purpose:
- Connect to ERP DB through DATABASE_URL.
- Check current existence of master_data schema/tables/views/functions/RLS/policies.
- Do not apply DDL.
- Do not apply RLS.
- Do not insert/update/delete.
- Produce precheck report before any future apply discussion.

guardrails:
- DDL_APPLY=NO
- RLS_APPLY=NO
- SEED_INSERT=NO
- UPDATE=NO
- DELETE=NO
- TRUNCATE=NO
- DROP=NO
- PSQL_EXECUTION=READ_ONLY_SELECT_ONLY

# ============================================================
