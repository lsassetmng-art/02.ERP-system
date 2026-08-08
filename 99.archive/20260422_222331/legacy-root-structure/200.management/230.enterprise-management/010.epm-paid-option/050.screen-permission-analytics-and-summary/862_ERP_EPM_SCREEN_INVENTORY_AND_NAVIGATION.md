# ============================================================
# ERP EPM SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-862
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.screen_inventory_and_navigation
component: epm-screen-inventory-and-navigation


# PRIMARY SCREENS

- epm_objective_tree_screen
- epm_objective_detail_screen
- epm_kpi_definition_screen
- epm_plan_cycle_screen
- epm_review_cycle_screen
- epm_scorecard_dashboard_screen
- epm_forecast_variance_screen
- epm_option_disabled_screen
- epm_option_suspended_screen
- epm_permission_denied_screen


# PRIMARY ENTRY FLOW

epm entry
-> objective tree
-> objective detail
-> kpi / plan / review / scorecard subflows

