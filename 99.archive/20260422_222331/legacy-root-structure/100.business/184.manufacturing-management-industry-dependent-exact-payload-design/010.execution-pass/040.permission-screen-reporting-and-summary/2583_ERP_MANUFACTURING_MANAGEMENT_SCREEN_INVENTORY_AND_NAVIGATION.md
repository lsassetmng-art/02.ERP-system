# ============================================================
# ERP MANUFACTURING MANAGEMENT SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2583
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_management.screen_inventory_and_navigation
component: manufacturing-management-screen-inventory-and-navigation


# PRIMARY SCREENS

- production_order_case_screen
- manufacturing_bom_reference_screen
- work_center_load_case_screen
- production_execution_case_screen
- production_completion_case_screen
- manufacturing_management_permission_denied_screen

# PRIMARY ENTRY FLOW

manufacturing entry
-> production order / bom
-> load / execution
-> completion

