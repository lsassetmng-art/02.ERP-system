# ============================================================
# RLS POLICY REVIEW CHECKLIST
# 52.master-data
# ============================================================

status: draft
owner: Boss
prepared_by: Zero
generated_at: 2026-05-15 06:01:35 +0900
module: 52.master-data
review_required:
- 佐藤（DB担当）
db_apply_status: STOPPED

# ============================================================
# 1. REVIEW CHECKLIST
# ============================================================

checklist:
- app.company_id context approach is acceptable.
- app.permissions comma-separated approach is acceptable for v1 draft.
- helper functions should be stable and safe.
- master_record select policy is company-scoped.
- write policies require explicit permissions.
- no delete policy exists for master records.
- source consumer acknowledgement is restricted to target_module = app.source_module.
- source consumer impact review is restricted to target_module = app.source_module.
- BI read is read-only.
- audit read is read-only.
- source extension matrix admin write is limited.
- domain table policies need final split by table before actual apply.
- RLS policy does not mutate source transactions.
- RLS policy does not expose secrets.
- RLS policy can layer on top of DDL proposal safely.
- Future API runtime can set context safely.

# ============================================================
# 2. KNOWN REVIEW POINTS
# ============================================================

known_review_points:
- Whether app.permissions should be comma-separated text or JWT claims JSON.
- Whether fn_rls_has_permission should parse JSON instead.
- Whether source_module restriction is enough for acknowledgement/impact review.
- Whether domain tables should each get strict explicit insert/update policies.
- Whether master_data_admin should exist as permission or role concept only.
- Whether views need security_invoker/security_barrier settings.
- Whether RLS should be applied before seed data.
- Whether service role bypass needs additional operational guardrails.

# ============================================================
# 3. REVIEW RESULT FIELD
# ============================================================

review_result:
- status: pending
- reviewer: 佐藤（DB担当）
- decision: not_reviewed
- reviewed_at: null
- required_changes: []
- approval_to_prepare_rls_apply_block: false
- approval_to_apply_rls: false

# ============================================================
