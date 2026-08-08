# ============================================================
# ERP MAINTENANCE MANAGEMENT SCREEN IN
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2771
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_management.screen_inventory_and_navigation
component: maintenance-management-screen-inventory-and-navigation


# PRIMARY SCREENS

- maintenance_asset_reference_screen
- preventive_maintenance_plan_case_screen
- maintenance_work_order_case_screen
- maintenance_execution_case_screen
- maintenance_downtime_event_case_screen
- maintenance_management_permission_denied_screen

# PRIMARY ENTRY FLOW

maintenance entry
-> asset / plan
-> work order / execution
-> downtime

