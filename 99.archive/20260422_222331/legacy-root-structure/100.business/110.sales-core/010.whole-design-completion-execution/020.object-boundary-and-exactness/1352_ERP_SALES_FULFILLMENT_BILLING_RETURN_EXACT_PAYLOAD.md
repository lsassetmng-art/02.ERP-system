# ============================================================
# ERP SALES FULFILLMENT BILLING RETURN EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1352
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.fulfillment_billing_return.exact_payload
component: sales-fulfillment-billing-return-exact-payload


# OBJECT 1

sales_fulfillment_instruction

Canonical payload:
- object_id
- company_id
- object_type = sales_fulfillment_instruction
- status
- sales_order_id
- fulfillment_instruction_code
- release_status_code
- requested_ship_date
- destination_reference_code
- released_quantity_total
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

sales_billing_instruction

Canonical payload:
- object_id
- company_id
- object_type = sales_billing_instruction
- status
- sales_order_id
- billing_instruction_code
- billing_status_code
- billable_amount_total
- billing_basis_code
- billing_release_date
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 3

sales_return_request

Canonical payload:
- object_id
- company_id
- object_type = sales_return_request
- status
- sales_order_id
- return_request_code
- return_status_code
- requested_return_date
- requested_quantity_total
- return_reason_code
- linked_billing_instruction_id
- created_at
- created_by
- updated_at
- updated_by

