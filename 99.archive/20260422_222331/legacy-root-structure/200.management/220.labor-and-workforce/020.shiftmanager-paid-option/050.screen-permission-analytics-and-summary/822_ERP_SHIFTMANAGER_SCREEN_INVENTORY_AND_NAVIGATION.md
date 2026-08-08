# ============================================================
# ERP SHIFTMANAGER SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-822
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.screen_inventory_and_navigation
component: shiftmanager-screen-inventory-and-navigation


# PRIMARY SCREENS

- shift_plan_board_screen
- shift_assignment_detail_screen
- shift_preference_submission_screen
- shift_preference_review_screen
- shift_swap_request_screen
- shift_swap_review_screen
- shift_publication_screen
- shiftmanager_option_disabled_screen
- shiftmanager_option_suspended_screen
- shiftmanager_permission_denied_screen


# PRIMARY ENTRY FLOW

shiftmanager entry
-> shift plan board
-> assignment detail
-> preference / swap / publication subflows

