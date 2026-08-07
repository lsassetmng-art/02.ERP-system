# ============================================================
# ERP NON-FROZEN AUTHORITY REVIEW QUEUE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Lists registry entries that should remain under active review
before frozen_candidate or frozen promotion.

review_queue:

  runtime_truth_competition:
  - system.exec_run_request
  - integration.integration_job

  settlement_truth_gap:
  - finance.payment_allocation
  - public.v_finance_payment_allocation

  ar_ap_base_truth_gap:
  - public.v_ar_accrual_preview
  - public.v_ap_accrual_preview

  approval_truth_competition:
  - workflow.approval_request
  - system.approval_request

main_reason_for_queue:
These entries still carry one or more of:
- unresolved competing candidates
- unresolved write-path topology
- unresolved base truth beneath projection
- unresolved final authority relationship

conclusion:
These are the main entries that still need targeted hardening
before promotion beyond hardened level.
