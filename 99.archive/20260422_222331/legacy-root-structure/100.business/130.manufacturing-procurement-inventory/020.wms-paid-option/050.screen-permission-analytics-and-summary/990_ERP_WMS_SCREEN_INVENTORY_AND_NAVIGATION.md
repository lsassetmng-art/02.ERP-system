# ============================================================
# ERP WMS SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-990
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.screen_inventory_and_navigation
component: wms-screen-inventory-and-navigation


# PRIMARY SCREENS

- wms_warehouse_location_screen
- wms_inventory_lot_screen
- wms_inbound_receipt_screen
- wms_outbound_pick_screen
- wms_stock_movement_screen
- wms_count_session_screen
- wms_discrepancy_screen
- wms_option_disabled_screen
- wms_option_suspended_screen
- wms_permission_denied_screen


# PRIMARY ENTRY FLOW

wms entry
-> warehouse / location
-> inventory / receipt
-> pick / movement / count / discrepancy subflows

