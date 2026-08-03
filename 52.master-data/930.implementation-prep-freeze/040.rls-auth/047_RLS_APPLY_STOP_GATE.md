# ============================================================
# RLS APPLY STOP GATE
# 52.master-data
# ============================================================

status: STOP
owner: Boss
prepared_by: Zero
module: 52.master-data
db_apply_status: STOPPED
psql_executed: NO
review_required:
- 佐藤（DB担当）

# ============================================================
# 1. STOP DECLARATION
# ============================================================

RLS_APPLY_STOP:
- Do not run 042_RLS_POLICY_PROPOSAL_DRAFT.sql yet.
- Do not enable RLS.
- Do not create policies.
- Do not create helper functions.
- Do not grant permissions.
- This is proposal-only.

# ============================================================
# 2. REQUIRED BEFORE RLS APPLY
# ============================================================

required_before_rls_apply:
- DDL proposal review PASS
- DDL apply completed or target objects confirmed existing
- RLS proposal review PASS
- explicit user approval
- 佐藤（DB担当） approval
- read-only DB precheck PASS
- rollback / verification plan
- psql "$DATABASE_URL" one-block

# ============================================================
# 3. NEXT SAFE ACTIONS
# ============================================================

next_safe_actions:
- revise RLS proposal after review
- create read-only DB precheck one-block
- create API route skeleton without DB mutation
- create UI skeleton without DB mutation

# ============================================================
