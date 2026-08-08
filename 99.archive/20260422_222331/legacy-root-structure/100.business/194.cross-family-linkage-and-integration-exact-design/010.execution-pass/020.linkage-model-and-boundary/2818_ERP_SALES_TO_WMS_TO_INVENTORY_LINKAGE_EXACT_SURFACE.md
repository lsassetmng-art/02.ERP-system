# ============================================================
# ERP SALES TO WMS TO INVENTORY LINKAGE EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2818
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_to_wms_to_inventory.linkage_exact_surface
component: sales-to-wms-to-inventory-linkage-exact-surface


# SURFACE

fulfillment_warehouse_execution_handoff

Canonical fields:
- handoff_id
- company_id
- source_family = sales
- target_family_set = wms, inventory
- linked_sales_fulfillment_reference_code
- linked_warehouse_task_case_id
- linked_pick_pack_wave_case_id
- fulfillment_item_reference_code
- fulfillment_quantity
- scheduled_ship_at
- warehouse_execution_state_code
- inventory_deduction_state_code
- handoff_status_code
- handoff_created_at

