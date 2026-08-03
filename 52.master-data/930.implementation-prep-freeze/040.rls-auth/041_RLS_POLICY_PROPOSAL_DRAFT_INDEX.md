# ============================================================
# 52.master-data RLS POLICY PROPOSAL DRAFT INDEX
# STOP付き・未適用
# ============================================================

status: draft
owner: Boss
prepared_by: Zero
generated_at: 2026-05-15 06:01:35 +0900
module: 52.master-data
phase: rls-policy-proposal-draft
db_apply_status: STOPPED
psql_executed: NO
db_env_later: DATABASE_URL
review_required:
- 佐藤（DB担当）

# ============================================================
# 1. PURPOSE
# ============================================================

purpose:
- Prepare RLS policy proposal draft for 52.master-data v1.
- Do not apply RLS.
- Do not run psql.
- Align RLS policy candidates with API exact payload freeze.
- Preserve company scope.
- Separate reader/editor/approver/publisher/source-consumer/BI/audit roles.
- Prevent source module direct mutation of shared master truth.
- Prevent BI/audit/approval direct mutation.

# ============================================================
# 2. CREATED FILES
# ============================================================

created_files:
- 041_RLS_POLICY_PROPOSAL_DRAFT_INDEX.md
- 042_RLS_POLICY_PROPOSAL_DRAFT.sql
- 043_RLS_POLICY_TO_API_PERMISSION_MATRIX.md
- 044_RLS_POLICY_REVIEW_CHECKLIST.md
- 045_RLS_LINT_READONLY_PRECHECK.sh
- 046_RLS_LINT_READONLY_PRECHECK_REPORT.md
- 047_RLS_APPLY_STOP_GATE.md

# ============================================================
# 3. POLICY GROUPS
# ============================================================

policy_groups:
- context helper functions
- master record read policies
- master record write policies
- version read/write policies
- identifier read/write policies
- role assignment policies
- publication package policies
- publication line policies
- consumer acknowledgement policies
- impact review policies
- source extension matrix read policies
- BI snapshot read policies

# ============================================================
# 4. STOP DECLARATION
# ============================================================

DB_APPLY_STOP:
- This proposal must not be executed yet.
- Any future RLS apply requires explicit user approval.
- Any future RLS apply requires 佐藤（DB担当） review.
- Any future SQL must use psql "$DATABASE_URL" one-block.
- This step only writes proposal files and runs static text lint.

# ============================================================
