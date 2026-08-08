# ============================================================
# ERP EPM SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1697
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm.screen_inventory_and_navigation
component: epm-screen-inventory-and-navigation


# PRIMARY SCREENS

- epm_objective_set_screen
- epm_kpi_metric_screen
- epm_scorecard_snapshot_screen
- epm_planning_review_cycle_screen
- epm_variance_case_screen
- epm_permission_denied_screen

# PRIMARY ENTRY FLOW

epm entry
-> objective / kpi
-> scorecard / planning-review
-> variance subflows

