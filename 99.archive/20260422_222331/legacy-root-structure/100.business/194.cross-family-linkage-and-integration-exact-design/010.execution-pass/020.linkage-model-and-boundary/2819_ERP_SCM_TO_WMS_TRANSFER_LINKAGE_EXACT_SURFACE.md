# ============================================================
# ERP SCM TO WMS TRANSFER LINKAGE EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2819
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.scm_to_wms_transfer.linkage_exact_surface
component: scm-to-wms-transfer-linkage-exact-surface


# SURFACE

transfer_execution_handoff

Canonical fields:
- handoff_id
- company_id
- source_family = scm
- target_family = wms
- linked_inter_node_transfer_plan_case_id
- linked_supply_commitment_coordination_case_id
- from_node_reference_code
- to_node_reference_code
- transferred_item_reference_code
- planned_transfer_quantity
- planned_ship_at
- linked_wms_transfer_reference_code
- handoff_status_code
- handoff_created_at
- handoff_acknowledged_at

