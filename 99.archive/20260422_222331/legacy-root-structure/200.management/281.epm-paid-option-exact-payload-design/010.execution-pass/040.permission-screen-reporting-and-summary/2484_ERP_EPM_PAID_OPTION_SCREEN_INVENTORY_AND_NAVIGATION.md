# ============================================================
# ERP EPM PAID OPTION SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2484
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm_paid_option.screen_inventory_and_navigation
component: epm-paid-option-screen-inventory-and-navigation


# PRIMARY SCREENS

- performance_plan_case_screen
- budget_coordination_case_screen
- forecast_coordination_case_screen
- variance_analysis_snapshot_screen
- management_dashboard_snapshot_screen
- epm_permission_denied_screen

# PRIMARY ENTRY FLOW

epm entry
-> plan / budget
-> forecast / variance
-> dashboard

