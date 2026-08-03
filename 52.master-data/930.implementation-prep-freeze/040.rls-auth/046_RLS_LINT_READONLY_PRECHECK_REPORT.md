# ============================================================
# 52.master-data RLS LINT READONLY PRECHECK REPORT
# ============================================================
generated_at: 2026-05-15 06:01:36 +0900
rls_sql: /data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/040.rls-auth/042_RLS_POLICY_PROPOSAL_DRAFT.sql
db_apply_status: STOPPED
psql_executed: NO

## 1. File existence
PASS: file exists: /data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/040.rls-auth/042_RLS_POLICY_PROPOSAL_DRAFT.sql
PASS: file exists: /data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/040.rls-auth/041_RLS_POLICY_PROPOSAL_DRAFT_INDEX.md
PASS: file exists: /data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/040.rls-auth/043_RLS_POLICY_TO_API_PERMISSION_MATRIX.md
PASS: file exists: /data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/040.rls-auth/044_RLS_POLICY_REVIEW_CHECKLIST.md
PASS: file exists: /data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/040.rls-auth/047_RLS_APPLY_STOP_GATE.md

## 2. STOP / review terms
PASS: RLS SQL contains DO NOT RUN warning
PASS: RLS SQL contains STOPPED status
PASS: RLS SQL contains Sato review requirement
PASS: RLS SQL contains future DATABASE_URL psql format

## 3. Required helper functions
PASS: helper exists: fn_rls_company_id
PASS: helper exists: fn_rls_actor_id
PASS: helper exists: fn_rls_source_module
PASS: helper exists: fn_rls_has_permission

## 4. Required RLS terms
PASS: RLS term exists: enable row level security
PASS: RLS term exists: create policy
PASS: RLS term exists: for select
PASS: RLS term exists: for insert
PASS: RLS term exists: for update
PASS: RLS term exists: with check
PASS: RLS term exists: company_id = master_data.fn_rls_company_id
PASS: RLS term exists: master.publication.acknowledge
PASS: RLS term exists: master.impact_review.create
PASS: RLS term exists: master.BI_snapshot.read
PASS: RLS term exists: master.audit.read

## 5. Unsafe SQL absence check
PASS: no DROP SCHEMA
PASS: no DROP TABLE
PASS: no TRUNCATE TABLE
PASS: no DELETE FROM
PASS: no ALTER TABLE DROP COLUMN
PASS: no service_role grant
PASS: no secret-like value terms

## 6. Count summary
HELPER_COUNT=4
ENABLE_RLS_COUNT=20
POLICY_COUNT=27
PASS: helper count is plausible
PASS: RLS enable count is plausible
PASS: policy count is plausible

## 7. Summary
PASS_COUNT=34
WARN_COUNT=0
FAIL_COUNT=0
FINAL_RESULT=PASS_READONLY_RLS_LINT
