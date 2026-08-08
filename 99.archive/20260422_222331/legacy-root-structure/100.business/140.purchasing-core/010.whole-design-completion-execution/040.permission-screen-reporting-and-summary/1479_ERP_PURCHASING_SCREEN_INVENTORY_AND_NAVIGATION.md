# ============================================================
# ERP PURCHASING SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1479
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchasing.screen_inventory_and_navigation
component: purchasing-screen-inventory-and-navigation


# PRIMARY SCREENS

- purchase_request_screen
- purchase_order_screen
- purchase_receipt_expectation_screen
- supplier_return_request_screen
- purchasing_permission_denied_screen

# PRIMARY ENTRY FLOW

purchasing entry
-> request
-> order
-> receipt expectation / supplier return subflows

