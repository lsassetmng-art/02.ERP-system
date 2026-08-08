# ============================================================
# ERP LABORMANAGER SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1660
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager.screen_inventory_and_navigation
component: labormanager-screen-inventory-and-navigation


# PRIMARY SCREENS

- labor_staff_profile_screen
- labor_attendance_record_screen
- labor_leave_request_screen
- labor_employment_lifecycle_case_screen
- labor_compliance_case_screen
- labormanager_permission_denied_screen

# PRIMARY ENTRY FLOW

labor entry
-> staff profile
-> attendance / leave
-> lifecycle / compliance subflows

