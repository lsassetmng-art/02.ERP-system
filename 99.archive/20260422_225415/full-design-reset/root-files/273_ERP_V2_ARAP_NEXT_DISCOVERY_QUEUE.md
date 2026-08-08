# ============================================================
# ERP V2 AR/AP NEXT DISCOVERY QUEUE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the next discovery queue for AR/AP
after semantic rediscovery reframing.

next_queue:
1. inspect public.v_purchase_purchase_invoice definition
2. inspect public.v_purchase_purchase_invoice_detail definition
3. inspect public.v_purchase_purchase_three_way_match definition
4. inspect public.v_sales_billing_detail definition
5. locate underlying purchase / sales base tables used by these views
6. decide which are projection-only and which imply closer base-truth candidates

expected_output:
- stronger receivable-side candidate map
- stronger payable-side candidate map
- narrower AR/AP unresolved space
- better basis for frozen-v2 admission or continued deferment

conclusion:
The next AR/AP step is no longer open-ended rediscovery.
It is targeted view-definition inspection.
