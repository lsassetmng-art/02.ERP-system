# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V1 DEFERRED ENTRIES
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Lists the entries intentionally deferred from frozen v1.

deferred_entries:

  runtime_truth_competition:
  - system.exec_run_request
  - integration.integration_job

  settlement_gap:
  - finance.payment_allocation
  - public.v_finance_payment_allocation

  ar_ap_gap:
  - public.v_ar_accrual_preview
  - public.v_ap_accrual_preview

  approval_truth_competition:
  - workflow.approval_request
  - system.approval_request

  lower_priority_deferred:
  - ops.job_execution_log
  - cron.job
  - audit.approval_request
  - govern.approval_request
  - governance.approval_request
  - notify.approval_request
  - public.approval_request_with_url
  - ai.approval_request

reason_for_deferral:
Each deferred entry still carries one or more of:
- unresolved central authority competition
- unresolved base-truth ambiguity
- unresolved feeder or topology ambiguity
- not necessary for frozen v1 minimal stable core

conclusion:
Deferred entries are not rejected.
They are simply held for the next frozen registry cycle.
