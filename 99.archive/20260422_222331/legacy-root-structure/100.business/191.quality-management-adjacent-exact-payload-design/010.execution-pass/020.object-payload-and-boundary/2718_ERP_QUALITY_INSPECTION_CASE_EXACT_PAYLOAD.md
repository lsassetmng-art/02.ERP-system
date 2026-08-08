# ============================================================
# ERP QUALITY INSPECTION CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2718
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_inspection_case.exact_payload
component: quality-inspection-case-exact-payload


# OBJECT

quality_inspection_case

Canonical payload:
- object_id
- company_id
- object_type = quality_inspection_case
- status
- quality_inspection_case_code
- inspection_status_code
- inspection_scope_code
- linked_production_execution_case_id
- linked_purchase_receipt_reference_code
- inspected_item_reference_code
- inspection_lot_reference_code
- sample_quantity
- accepted_quantity
- rejected_quantity
- inspected_at
- inspector_reference_code
- created_at
- created_by
- updated_at
- updated_by

