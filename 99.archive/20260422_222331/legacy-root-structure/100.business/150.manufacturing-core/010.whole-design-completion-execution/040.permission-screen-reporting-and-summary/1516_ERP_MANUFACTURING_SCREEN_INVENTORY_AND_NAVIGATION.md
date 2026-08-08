# ============================================================
# ERP MANUFACTURING SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1516
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing.screen_inventory_and_navigation
component: manufacturing-screen-inventory-and-navigation


# PRIMARY SCREENS

- production_order_screen
- production_operation_screen
- manufacturing_material_issue_request_screen
- production_completion_receipt_screen
- manufacturing_scrap_declaration_screen
- manufacturing_permission_denied_screen

# PRIMARY ENTRY FLOW

manufacturing entry
-> production order
-> operation / issue
-> completion / scrap subflows

