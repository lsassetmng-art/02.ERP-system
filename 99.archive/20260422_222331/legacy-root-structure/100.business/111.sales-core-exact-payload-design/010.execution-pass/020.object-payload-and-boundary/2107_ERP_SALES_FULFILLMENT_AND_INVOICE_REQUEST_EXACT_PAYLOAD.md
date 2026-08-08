# ============================================================
# ERP SALES FULFILLMENT AND INVOICE REQUEST EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2107
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_fulfillment_and_invoice_request.exact_payload
component: sales-fulfillment-and-invoice-request-exact-payload


# OBJECT 1

sales_fulfillment_instruction

Canonical payload:
- object_id
- company_id
- object_type = sales_fulfillment_instruction
- status
- fulfillment_instruction_code
- fulfillment_status_code
- linked_sales_order_id
- requested_warehouse_reference_code
- requested_ship_date
- allocation_required_flag
- fulfillment_priority_code
- fulfillment_owner_reference_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

sales_invoice_request

Canonical payload:
- object_id
- company_id
- object_type = sales_invoice_request
- status
- sales_invoice_request_code
- invoice_request_status_code
- linked_sales_order_id
- linked_fulfillment_instruction_id
- invoice_basis_code
- bill_to_reference_code
- invoice_currency_code
- invoice_requested_at
- accounting_handoff_state_code
- created_at
- created_by
- updated_at
- updated_by

