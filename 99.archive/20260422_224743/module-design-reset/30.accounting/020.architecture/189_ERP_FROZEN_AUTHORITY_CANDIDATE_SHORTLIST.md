# ============================================================
# ERP FROZEN AUTHORITY CANDIDATE SHORTLIST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Shortlists the current strongest frozen_candidate entries.

frozen_candidate_shortlist:

  accounting_truth_side:
  - public.accounting_period
  - public.journal_entries
  - public.journal_lines

  runtime_support_side:
  - ops.ops_job_queue
  - ops.ops_job_result
  - cron.job_run_details
  - integration.integration_outbox
  - core.sync_queue

  header_write_authority_side:
  - sales.order_header
  - purchase.purchase_order_header
  - sales.billing_header
  - sales.return_header
  - sales.shipping_header

  header_projection_side:
  - public.order_header
  - public.purchase_order_header
  - public.billing_header
  - public.return_header
  - public.shipping_header

why_shortlisted:
These entries have the strongest current combination of:
- stable semantic role
- stable physical role
- narrowed competition
- evidence-backed interpretation
- low enough ambiguity for default working use

not_yet_shortlisted:
- system.exec_run_request
- integration.integration_job
- finance.payment_allocation
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview
- workflow.approval_request
- system.approval_request

conclusion:
This shortlist is the best current starting set
for future frozen-candidate promotion review.
