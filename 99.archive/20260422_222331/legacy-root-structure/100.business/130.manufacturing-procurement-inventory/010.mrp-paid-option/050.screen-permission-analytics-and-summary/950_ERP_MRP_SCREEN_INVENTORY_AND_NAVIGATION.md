# ============================================================
# ERP MRP SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-950
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.screen_inventory_and_navigation
component: mrp-screen-inventory-and-navigation


# PRIMARY SCREENS

- mrp_demand_program_screen
- mrp_bom_definition_screen
- mrp_requirement_run_screen
- mrp_planned_order_board_screen
- mrp_purchase_recommendation_screen
- mrp_planning_exception_screen
- mrp_option_disabled_screen
- mrp_option_suspended_screen
- mrp_permission_denied_screen


# PRIMARY ENTRY FLOW

mrp entry
-> demand / bom
-> requirement run
-> planned order / recommendation / exception subflows

