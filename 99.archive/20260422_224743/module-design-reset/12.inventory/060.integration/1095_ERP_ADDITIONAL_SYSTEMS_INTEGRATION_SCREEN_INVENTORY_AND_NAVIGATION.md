# ============================================================
# ERP ADDITIONAL SYSTEMS INTEGRATION SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1095
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.additional_systems.integration_screen_inventory_and_navigation
component: additional-systems-integration-screen-inventory-and-navigation


# PRIMARY SCREENS

- additional_systems_portfolio_overview_screen
- option_family_map_screen
- dependency_chain_screen
- source_truth_matrix_screen
- rollout_and_enablement_screen
- additional_systems_permission_denied_screen


# PRIMARY ENTRY FLOW

additional systems entry
-> portfolio overview
-> family map
-> dependency and rollout subflows

