# ============================================================
# ERP MANUFACTURING TO QUALITY LINKAGE EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2815
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_to_quality.linkage_exact_surface
component: manufacturing-to-quality-linkage-exact-surface


# SURFACE

manufacturing_to_quality_inspection_handoff

Canonical fields:
- handoff_id
- company_id
- source_family = manufacturing_management
- target_family = quality_management
- linked_production_execution_case_id
- linked_production_completion_case_id
- inspected_item_reference_code
- inspection_lot_reference_code
- execution_result_code
- executed_quantity
- rejected_quantity
- handoff_reason_code
- handoff_status_code
- handoff_created_at
- handoff_acknowledged_at

