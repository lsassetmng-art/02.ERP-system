# ============================================================
# ERP SFA PAID OPTION SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2393
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sfa_paid_option.screen_inventory_and_navigation
component: sfa-paid-option-screen-inventory-and-navigation


# PRIMARY SCREENS

- sales_lead_screen
- sales_opportunity_screen
- opportunity_stage_progression_screen
- sales_forecast_case_screen
- next_action_task_screen
- sfa_permission_denied_screen

# PRIMARY ENTRY FLOW

sfa entry
-> lead / opportunity
-> stage progression / forecast
-> next action

