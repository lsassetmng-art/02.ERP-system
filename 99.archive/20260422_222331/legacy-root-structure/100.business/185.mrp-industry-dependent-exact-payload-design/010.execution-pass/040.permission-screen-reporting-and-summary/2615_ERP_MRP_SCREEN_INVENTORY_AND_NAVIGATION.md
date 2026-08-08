# ============================================================
# ERP MRP SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2615
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.mrp.screen_inventory_and_navigation
component: mrp-screen-inventory-and-navigation


# PRIMARY SCREENS

- demand_requirement_case_screen
- planned_supply_order_case_screen
- shortage_projection_snapshot_screen
- replenishment_recommendation_case_screen
- plan_run_case_screen
- mrp_permission_denied_screen

# PRIMARY ENTRY FLOW

mrp entry
-> demand / plan run
-> planned supply / shortage
-> recommendation

