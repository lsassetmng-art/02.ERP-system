# ============================================================
# ERP WHOLE SYSTEM INTEGRATION SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1129
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.whole_system.integration_screen_inventory_and_navigation
component: whole-system-integration-screen-inventory-and-navigation


# PRIMARY SCREENS

- erp_whole_system_overview_screen
- erp_domain_and_option_map_screen
- erp_source_truth_matrix_screen
- erp_portfolio_dependency_chain_screen
- erp_rollout_and_maturity_screen
- erp_whole_system_permission_denied_screen


# PRIMARY ENTRY FLOW

whole system entry
-> whole overview
-> domain and option map
-> source truth / dependency / rollout subflows

