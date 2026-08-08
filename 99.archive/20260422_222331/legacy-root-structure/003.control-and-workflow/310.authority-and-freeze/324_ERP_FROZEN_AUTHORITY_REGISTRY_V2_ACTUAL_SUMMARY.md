# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V2 ACTUAL SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the actual newly frozen set in v2.

newly_frozen_in_v2:
- system.exec_run_request
- audit.approval_request
- finance.payment_allocation

layered_frozen_in_v2:
- public.v_finance_payment_allocation

working_draft_after_v2:
- sales.billing_header
- sales.billing_detail
- purchase.purchase_invoice
- purchase.purchase_invoice_detail
- purchase.purchase_three_way_match
- public.v_sales_billing_detail
- public.v_purchase_purchase_three_way_match

still_deferred_after_v2:
- integration.integration_job
- system.approval_request
- notify.approval_request
- broader settlement extra-truth scope

main_meaning:
Frozen authority registry v2 actual set extends the frozen corpus
beyond v1 in runtime, approval, and settlement,
while keeping AR/AP and companion objects structurally separated.

conclusion:
V2 now has a concrete actual freeze result,
not only a draft and decision frame.
