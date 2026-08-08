# ============================================================
# ERP AUTHORITY REGISTRY DRAFT SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the current ERP authority registry draft.

# ============================================================
# 1. STRONGEST CURRENT SOURCE-OF-TRUTH CANDIDATES
# ============================================================

strongest_current_source_of_truth_candidates:
- public.accounting_period
- public.journal_entries
- public.journal_lines
- sales.order_header
- purchase.purchase_order_header
- sales.billing_header
- sales.return_header
- sales.shipping_header
- system.exec_run_request
- workflow.approval_request (first-pass strongest in approval family)

# ============================================================
# 2. STRONGEST CURRENT PROJECTION / VIEW FAMILIES
# ============================================================

strongest_current_projection_view_families:
- public.order_header
- public.purchase_order_header
- public.billing_header
- public.return_header
- public.shipping_header
- public.v_finance_payment_allocation
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview
- public.approval_request_with_url

# ============================================================
# 3. STRONGEST CURRENT SUPPORT / HISTORY FAMILIES
# ============================================================

strongest_current_support_history_families:
- ops.ops_job_queue
- ops.ops_job_result
- cron.job
- cron.job_run_details
- integration.integration_outbox
- core.sync_queue
- notify.approval_request
- ai.approval_request
- govern.approval_request
- governance.approval_request
- audit.approval_request

# ============================================================
# 4. STILL OPEN
# ============================================================

still_open:
- exact runtime final write-path topology
- settlement header truth
- AR/AP base ledger truth
- workflow.approval_request vs system.approval_request final authority
- final frozen authority registry

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
The authority registry draft is now strong enough
to serve as the current working authority map,
while still clearly marking unresolved areas.

# ============================================================
# FROZEN CANDIDATE FRONTIER
# ============================================================

FROZEN CANDIDATE FRONTIER

Current frontier files:
- 189_ERP_FROZEN_AUTHORITY_CANDIDATE_SHORTLIST.md
- 190_ERP_NON_FROZEN_AUTHORITY_REVIEW_QUEUE.md
- 191_ERP_AUTHORITY_UNRESOLVED_QUESTIONS.md
- 192_ERP_AUTHORITY_NEXT_VERIFICATION_QUEUE.md
- 193_ERP_AUTHORITY_REGISTRY_MATURITY_SUMMARY.md

Meaning:
The authority registry draft now has a visible frontier
between:
- entries ready for frozen_candidate review
and
- entries still kept in hardened review.

