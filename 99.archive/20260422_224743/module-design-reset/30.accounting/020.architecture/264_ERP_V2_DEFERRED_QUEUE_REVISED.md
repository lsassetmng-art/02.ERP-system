# ============================================================
# ERP V2 DEFERRED QUEUE REVISED
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Revises the deferred queue after the latest actual-result pass.

revised_deferred_queue:

  still_deferred_but_weaker_competition:
  - integration.integration_job
  - system.approval_request

  still_deferred_due_to_name_gap:
  - public.v_ar_accrual_preview
  - public.v_ap_accrual_preview

  still_deferred_due_to_scope_gap:
  - settlement header/base truth beyond payment_allocation

main_change:
The deferred queue is now narrower than before.

what_moved_out_of_generic_deferral:
- system.exec_run_request
- finance.payment_allocation
- public.v_finance_payment_allocation
- audit.approval_request

conclusion:
The deferred queue is now more focused and more actionable.
