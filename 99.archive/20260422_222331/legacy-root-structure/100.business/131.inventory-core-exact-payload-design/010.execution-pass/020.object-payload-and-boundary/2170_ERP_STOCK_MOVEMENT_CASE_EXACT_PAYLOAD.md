# ============================================================
# ERP STOCK MOVEMENT CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2170
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.stock_movement_case.exact_payload
component: stock-movement-case-exact-payload


# OBJECT

stock_movement_case

Canonical payload:
- object_id
- company_id
- object_type = stock_movement_case
- status
- stock_movement_case_code
- movement_status_code
- movement_type_code
- linked_sales_fulfillment_instruction_id
- linked_receipt_expectation_id
- source_location_reference_code
- destination_location_reference_code
- movement_quantity
- unit_code
- movement_effective_at
- movement_owner_reference_code
- created_at
- created_by
- updated_at
- updated_by

