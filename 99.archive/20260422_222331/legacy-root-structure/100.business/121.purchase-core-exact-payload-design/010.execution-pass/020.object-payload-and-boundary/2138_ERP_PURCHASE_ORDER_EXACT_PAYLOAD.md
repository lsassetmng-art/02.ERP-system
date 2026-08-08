# ============================================================
# ERP PURCHASE ORDER EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2138
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase_order.exact_payload
component: purchase-order-exact-payload


# OBJECT

purchase_order

Canonical payload:
- object_id
- company_id
- object_type = purchase_order
- status
- purchase_order_code
- order_status_code
- supplier_reference_code
- linked_purchase_request_id
- order_date
- promised_receipt_date
- order_currency_code
- order_total_amount
- approval_state_code
- purchase_owner_reference_code
- created_at
- created_by
- updated_at
- updated_by

