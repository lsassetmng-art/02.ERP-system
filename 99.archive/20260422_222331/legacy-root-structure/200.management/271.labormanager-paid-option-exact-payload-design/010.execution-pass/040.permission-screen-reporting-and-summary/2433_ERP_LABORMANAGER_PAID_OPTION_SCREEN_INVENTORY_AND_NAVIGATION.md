# ============================================================
# ERP LABORMANAGER PAID OPTION SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2433
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager_paid_option.screen_inventory_and_navigation
component: labormanager-paid-option-screen-inventory-and-navigation


# PRIMARY SCREENS

- labor_staff_profile_screen
- labor_attendance_case_screen
- labor_leave_request_case_screen
- labor_onboarding_case_screen
- labor_offboarding_case_screen
- labor_training_completion_case_screen
- labor_compliance_check_case_screen
- labormanager_permission_denied_screen

# PRIMARY ENTRY FLOW

labormanager entry
-> staff / attendance / leave
-> onboarding / offboarding
-> training / compliance

