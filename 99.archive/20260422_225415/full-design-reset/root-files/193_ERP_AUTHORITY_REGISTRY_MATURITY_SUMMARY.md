# ============================================================
# ERP AUTHORITY REGISTRY MATURITY SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes current maturity distribution
across the authority registry draft.

maturity_distribution:

  frozen_candidate_like_cluster:
  - public.accounting_period
  - public.journal_entries
  - public.journal_lines
  - ops.ops_job_queue
  - ops.ops_job_result
  - cron.job_run_details
  - integration.integration_outbox
  - core.sync_queue
  - sales.order_header
  - purchase.purchase_order_header
  - sales.billing_header
  - sales.return_header
  - sales.shipping_header
  - public.order_header
  - public.purchase_order_header
  - public.billing_header
  - public.return_header
  - public.shipping_header

  hardened_cluster:
  - system.exec_run_request
  - integration.integration_job
  - finance.payment_allocation
  - public.v_finance_payment_allocation
  - public.v_ar_accrual_preview
  - public.v_ap_accrual_preview
  - workflow.approval_request
  - system.approval_request
  - audit.approval_request
  - govern.approval_request
  - governance.approval_request
  - notify.approval_request
  - public.approval_request_with_url
  - ai.approval_request

main_reading:
The registry is now strong enough
to separate a relatively stable frozen-candidate frontier
from a still-active hardened review frontier.

conclusion:
The next step is not rebuilding the registry,
but selectively pushing hardened entries toward frozen_candidate.

# ============================================================
# PROMOTION CHECKPOINT
# ============================================================

PROMOTION CHECKPOINT

Meaning:
The maturity summary now functions as the promotion checkpoint
for authority entries.

Use together with:
- 189_ERP_FROZEN_AUTHORITY_CANDIDATE_SHORTLIST.md
- 190_ERP_NON_FROZEN_AUTHORITY_REVIEW_QUEUE.md
- 191_ERP_AUTHORITY_UNRESOLVED_QUESTIONS.md
- 192_ERP_AUTHORITY_NEXT_VERIFICATION_QUEUE.md

Role:
This checkpoint separates:
- the frozen_candidate frontier
from
- the still-hardened review frontier.

