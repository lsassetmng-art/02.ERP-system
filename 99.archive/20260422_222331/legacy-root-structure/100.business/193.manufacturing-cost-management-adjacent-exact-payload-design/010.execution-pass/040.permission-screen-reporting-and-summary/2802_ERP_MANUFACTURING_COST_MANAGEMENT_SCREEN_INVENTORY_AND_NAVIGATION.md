# ============================================================
# ERP MANUFACTURING COST MANAGEMENT SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2802
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_cost_management.screen_inventory_and_navigation
component: manufacturing-cost-management-screen-inventory-and-navigation


# PRIMARY SCREENS

- cost_collection_case_screen
- standard_cost_snapshot_screen
- actual_cost_accumulation_case_screen
- production_cost_variance_case_screen
- cost_closure_case_screen
- manufacturing_cost_management_permission_denied_screen

# PRIMARY ENTRY FLOW

manufacturing cost entry
-> collection / standard cost
-> actual cost / variance
-> cost closure

