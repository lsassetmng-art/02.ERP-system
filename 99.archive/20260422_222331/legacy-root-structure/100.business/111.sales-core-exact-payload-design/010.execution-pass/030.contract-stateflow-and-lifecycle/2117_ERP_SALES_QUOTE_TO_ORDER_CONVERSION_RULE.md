# ============================================================
# ERP SALES QUOTE TO ORDER CONVERSION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2117
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.quote_to_order_conversion.rule
component: sales-quote-to-order-conversion-rule


# RULE

Quote acceptance may create or justify an order,
but quote truth does not disappear.

Conversion should preserve:
- originating quote reference
- conversion actor
- conversion timestamp
- variance note if order terms differ from accepted quote

