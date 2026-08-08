# ============================================================
# ERP SCM SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2679
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.scm.screen_inventory_and_navigation
component: scm-screen-inventory-and-navigation


# PRIMARY SCREENS

- supply_network_node_registry_screen
- inter_node_transfer_plan_case_screen
- supply_commitment_coordination_case_screen
- service_level_exception_case_screen
- supply_risk_snapshot_screen
- scm_permission_denied_screen

# PRIMARY ENTRY FLOW

scm entry
-> node / transfer
-> commitment / exception
-> risk

