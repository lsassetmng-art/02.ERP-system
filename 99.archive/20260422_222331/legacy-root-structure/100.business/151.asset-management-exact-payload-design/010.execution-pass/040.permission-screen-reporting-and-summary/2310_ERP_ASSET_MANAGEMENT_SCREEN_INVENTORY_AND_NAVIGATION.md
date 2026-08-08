# ============================================================
# ERP ASSET MANAGEMENT SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2310
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_management.screen_inventory_and_navigation
component: asset-management-screen-inventory-and-navigation


# PRIMARY SCREENS

- asset_master_screen
- asset_acquisition_case_screen
- asset_depreciation_cycle_screen
- asset_transfer_case_screen
- asset_disposal_case_screen
- asset_permission_denied_screen

# PRIMARY ENTRY FLOW

asset entry
-> asset master / acquisition
-> depreciation / transfer
-> disposal

