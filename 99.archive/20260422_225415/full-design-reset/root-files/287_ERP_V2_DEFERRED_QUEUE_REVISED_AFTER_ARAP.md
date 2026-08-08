# ============================================================
# ERP V2 DEFERRED QUEUE REVISED AFTER AR/AP
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Revises the deferred queue
after AR/AP role-comparison results.

revised_deferred_queue:

  runtime_competition_tail:
  - integration.integration_job

  approval_competition_tail:
  - system.approval_request
  - notify.approval_request

  ar_scope_open:
  - final scope split between sales.billing_header and sales.billing_detail

  ap_scope_open:
  - final scope split between purchase.purchase_invoice and purchase.purchase_invoice_detail
  - final role of purchase.purchase_three_way_match

  surface_only_review:
  - public.v_sales_billing_detail
  - public.v_purchase_purchase_three_way_match

main_change:
AR/AP is no longer deferred due to name discovery.
It is now deferred only on final scope and role decisions.

conclusion:
The deferred queue is now narrower
and mostly about scope refinement rather than object discovery.
