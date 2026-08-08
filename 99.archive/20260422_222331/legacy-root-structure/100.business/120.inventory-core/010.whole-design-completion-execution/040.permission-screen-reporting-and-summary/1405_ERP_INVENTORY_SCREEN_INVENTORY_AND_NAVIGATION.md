# ============================================================
# ERP INVENTORY SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1405
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.screen_inventory_and_navigation
component: inventory-screen-inventory-and-navigation


# PRIMARY SCREENS

- inventory_stock_record_screen
- inventory_reservation_screen
- inventory_transfer_request_screen
- inventory_adjustment_request_screen
- inventory_count_reconciliation_screen
- inventory_permission_denied_screen

# PRIMARY ENTRY FLOW

inventory entry
-> stock
-> reservation / transfer
-> adjustment / count reconciliation subflows

