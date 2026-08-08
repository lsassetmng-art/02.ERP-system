# ============================================================
# ERP SFA OPTION SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-746
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.screen_inventory_and_navigation
component: sfa-option-screen-inventory-and-navigation


# PRIMARY SCREENS

- sfa_lead_list_screen
- sfa_lead_detail_screen
- sfa_opportunity_board_screen
- sfa_opportunity_detail_screen
- sfa_opportunity_edit_screen
- sfa_sales_action_list_screen
- sfa_sales_action_write_screen
- sfa_forecast_dashboard_screen
- sfa_option_disabled_screen
- sfa_option_suspended_screen
- sfa_permission_denied_screen


# PRIMARY ENTRY FLOW

sfa entry
-> lead list
-> opportunity board
-> opportunity detail
-> action and forecast subflows

