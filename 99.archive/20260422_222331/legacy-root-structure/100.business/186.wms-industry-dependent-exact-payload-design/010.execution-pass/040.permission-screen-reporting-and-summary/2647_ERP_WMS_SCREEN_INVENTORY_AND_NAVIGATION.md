# ============================================================
# ERP WMS SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2647
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.wms.screen_inventory_and_navigation
component: wms-screen-inventory-and-navigation


# PRIMARY SCREENS

- warehouse_task_case_screen
- bin_allocation_case_screen
- pick_pack_wave_case_screen
- receiving_dock_execution_case_screen
- warehouse_exception_case_screen
- wms_permission_denied_screen

# PRIMARY ENTRY FLOW

wms entry
-> warehouse task / bin
-> wave / receiving
-> exception

