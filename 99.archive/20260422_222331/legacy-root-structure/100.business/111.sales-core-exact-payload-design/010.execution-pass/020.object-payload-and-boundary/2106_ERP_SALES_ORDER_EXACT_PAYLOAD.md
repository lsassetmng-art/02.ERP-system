# ============================================================
# ERP SALES ORDER EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2106
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_order.exact_payload
component: sales-order-exact-payload


# OBJECT

sales_order

Canonical payload:
- object_id
- company_id
- object_type = sales_order
- status
- sales_order_code
- order_status_code
- customer_reference_code
- linked_sales_quote_id
- order_date
- requested_ship_date
- promised_delivery_date
- order_currency_code
- order_total_amount
- approval_state_code
- sales_owner_reference_code
- created_at
- created_by
- updated_at
- updated_by

