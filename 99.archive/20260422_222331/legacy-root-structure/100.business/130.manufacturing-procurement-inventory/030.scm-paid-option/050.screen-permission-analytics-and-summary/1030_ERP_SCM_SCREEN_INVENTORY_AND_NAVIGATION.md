# ============================================================
# ERP SCM SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1030
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.screen_inventory_and_navigation
component: scm-screen-inventory-and-navigation


# PRIMARY SCREENS

- scm_network_node_screen
- scm_supplier_profile_screen
- scm_supply_lane_screen
- scm_supply_plan_screen
- scm_replenishment_signal_screen
- scm_transfer_recommendation_screen
- scm_disruption_event_screen
- scm_resilience_assessment_screen
- scm_option_disabled_screen
- scm_option_suspended_screen
- scm_permission_denied_screen


# PRIMARY ENTRY FLOW

scm entry
-> network / supplier / lane
-> supply plan
-> replenishment / transfer / disruption / resilience subflows

