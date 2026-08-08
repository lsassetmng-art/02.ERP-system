# ============================================================
# ERP MPI INTEGRATION SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1061
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mpi.integration_screen_inventory_and_navigation
component: mpi-integration-screen-inventory-and-navigation


# PRIMARY SCREENS

- mpi_family_overview_screen
- mpi_planning_to_execution_chain_screen
- mpi_network_and_disruption_chain_screen
- mpi_stock_feedback_chain_screen
- mpi_exception_escalation_screen
- mpi_integration_permission_denied_screen


# PRIMARY ENTRY FLOW

mpi integration entry
-> family overview
-> handoff chain view
-> exception and feedback subflows

