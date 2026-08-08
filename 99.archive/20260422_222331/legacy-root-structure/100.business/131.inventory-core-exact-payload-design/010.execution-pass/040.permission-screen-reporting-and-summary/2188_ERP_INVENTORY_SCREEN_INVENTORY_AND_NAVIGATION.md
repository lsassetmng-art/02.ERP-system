# ============================================================
# ERP INVENTORY SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2188
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.screen_inventory_and_navigation
component: inventory-screen-inventory-and-navigation


# PRIMARY SCREENS

- item_stock_ledger_screen
- stock_movement_case_screen
- allocation_reservation_case_screen
- count_adjustment_case_screen
- replenishment_signal_screen
- inventory_permission_denied_screen

# PRIMARY ENTRY FLOW

inventory entry
-> stock ledger / movement
-> reservation / adjustment
-> replenishment

