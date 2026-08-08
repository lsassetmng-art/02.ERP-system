# ============================================================
# ERP QUALITY MANAGEMENT SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2738
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_management.screen_inventory_and_navigation
component: quality-management-screen-inventory-and-navigation


# PRIMARY SCREENS

- quality_inspection_case_screen
- quality_nonconformance_case_screen
- quality_hold_case_screen
- corrective_action_case_screen
- quality_release_decision_case_screen
- quality_management_permission_denied_screen

# PRIMARY ENTRY FLOW

quality entry
-> inspection / nonconformance
-> hold / corrective action
-> release decision

