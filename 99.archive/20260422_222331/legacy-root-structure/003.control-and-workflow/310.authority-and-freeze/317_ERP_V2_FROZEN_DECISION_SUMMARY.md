# ============================================================
# ERP V2 FROZEN DECISION SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the current freeze decisions
for frozen authority registry v2.

freeze_now:
- system.exec_run_request
- audit.approval_request
- finance.payment_allocation

freeze_in_layered_form:
- public.v_finance_payment_allocation

keep_as_working_draft:
- sales.billing_header
- sales.billing_detail
- purchase.purchase_invoice
- purchase.purchase_invoice_detail
- purchase.purchase_three_way_match
- public.v_sales_billing_detail
- public.v_purchase_purchase_three_way_match

keep_deferred:
- integration.integration_job
- system.approval_request
- notify.approval_request
- broader settlement extra-truth scope

main_meaning:
V2 is now strong enough to add real new frozen entries
in runtime, approval, and settlement,
while AR/AP remains structured but not fully closed.

conclusion:
Frozen authority registry v2 can now be split into:
- actual newly frozen entries
- layered surface entries
- working-draft AR/AP entries
- deferred companions
