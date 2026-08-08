# ============================================================
# ERP MRP TO MANUFACTURING LINKAGE EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2814
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.mrp_to_manufacturing.linkage_exact_surface
component: mrp-to-manufacturing-linkage-exact-surface


# SURFACE

mrp_to_manufacturing_supply_handoff

Canonical fields:
- handoff_id
- company_id
- source_family = mrp
- target_family = manufacturing_management
- linked_planned_supply_order_case_id
- linked_demand_requirement_case_id
- supplied_item_reference_code
- planned_quantity
- planned_start_at
- planned_end_at
- downstream_handoff_target_code
- handoff_status_code
- handoff_created_at
- handoff_acknowledged_at

