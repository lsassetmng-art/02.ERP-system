# ============================================================
# ERP LABORMANAGER SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-784
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.screen_inventory_and_navigation
component: labormanager-screen-inventory-and-navigation


# PRIMARY SCREENS

- labor_staff_list_screen
- labor_staff_detail_screen
- labor_attendance_board_screen
- labor_leave_request_screen
- labor_leave_approval_screen
- labor_onboarding_case_screen
- labor_offboarding_case_screen
- labor_training_compliance_screen
- labormanager_option_disabled_screen
- labormanager_option_suspended_screen
- labormanager_permission_denied_screen


# PRIMARY ENTRY FLOW

labormanager entry
-> staff list
-> staff detail
-> attendance / leave / onboarding / compliance subflows

