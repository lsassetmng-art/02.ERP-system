# ============================================================
# ERP SALES ORDER AND LINE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1351
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.order_and_line.exact_payload
component: sales-order-and-line-exact-payload


# OBJECT 1

sales_order

Canonical payload:
- object_id
- company_id
- object_type = sales_order
- status
- sales_order_code
- customer_reference_code
- order_status_code
- order_date
- promised_ship_date
- currency_code
- order_amount_total
- tax_amount_total
- linked_quote_id
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

sales_order_line

Canonical payload:
- object_id
- company_id
- object_type = sales_order_line
- status
- sales_order_id
- line_no
- item_reference_code
- ordered_quantity
- unit_price
- line_amount_total
- fulfillment_status_code
- billing_status_code
- created_at
- created_by
- updated_at
- updated_by

