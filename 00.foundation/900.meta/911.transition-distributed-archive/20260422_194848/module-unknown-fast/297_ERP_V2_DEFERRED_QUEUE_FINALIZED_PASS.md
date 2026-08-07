# ============================================================
# ERP V2 DEFERRED QUEUE FINALIZED PASS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the revised deferred queue
after approval and AR/AP role clarification.

finalized_deferred_queue:

  runtime_tail:
  - integration.integration_job

  approval_tail:
  - system.approval_request
  - notify.approval_request

  settlement_scope_open:
  - whether finance.payment_allocation is sufficient alone
  - whether additional settlement header/base truth exists

  ar_scope_open:
  - final scope split between sales.billing_header and sales.billing_detail

  ap_scope_open:
  - final scope split between purchase.purchase_invoice and purchase.purchase_invoice_detail
  - final role of purchase.purchase_three_way_match

  surface_freeze_review:
  - public.v_finance_payment_allocation
  - public.v_sales_billing_detail
  - public.v_purchase_purchase_three_way_match
  - public.approval_request_with_url

conclusion:
The deferred queue is now mostly a scope/refinement queue,
not a discovery queue.
