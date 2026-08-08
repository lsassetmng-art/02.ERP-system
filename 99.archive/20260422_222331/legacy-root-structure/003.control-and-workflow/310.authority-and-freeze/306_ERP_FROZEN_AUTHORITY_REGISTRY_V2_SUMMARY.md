# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V2 SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the current frozen-v2 draft position.

main_v2_promotion_candidates:
- system.exec_run_request
- audit.approval_request
- finance.payment_allocation

working_draft_candidates:
- sales.billing_header
- sales.billing_detail
- purchase.purchase_invoice
- purchase.purchase_invoice_detail
- purchase.purchase_three_way_match

surface_review_only:
- public.v_finance_payment_allocation
- public.v_sales_billing_detail
- public.v_purchase_purchase_three_way_match
- public.approval_request_with_url

still_deferred:
- integration.integration_job
- system.approval_request
- notify.approval_request
- settlement extra truth scope
- AR/AP final scope decisions

main_meaning:
Frozen authority registry v2 is now forming around
runtime, approval, and settlement first,
with AR/AP entering as a structured working draft.

conclusion:
The v2 draft is no longer abstract.
It now has concrete promotion candidates,
working-draft families, and clearly separated surface/deferred layers.
