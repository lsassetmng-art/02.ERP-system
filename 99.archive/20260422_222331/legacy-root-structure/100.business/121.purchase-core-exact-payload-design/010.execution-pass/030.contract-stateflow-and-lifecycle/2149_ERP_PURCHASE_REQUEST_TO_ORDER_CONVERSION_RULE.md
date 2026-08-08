# ============================================================
# ERP PURCHASE REQUEST TO ORDER CONVERSION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2149
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase.request_to_order_conversion.rule
component: purchase-request-to-order-conversion-rule


# RULE

Request approval may create or justify an order,
but request truth does not disappear.

Conversion should preserve:
- originating request reference
- conversion actor
- conversion timestamp
- variance note if order terms differ from approved request

