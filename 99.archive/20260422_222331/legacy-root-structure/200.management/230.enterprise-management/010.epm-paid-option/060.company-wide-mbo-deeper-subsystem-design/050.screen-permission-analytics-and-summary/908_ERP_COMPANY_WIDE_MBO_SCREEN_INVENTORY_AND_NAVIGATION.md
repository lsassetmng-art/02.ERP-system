# ============================================================
# ERP COMPANY WIDE MBO SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-908
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.screen_inventory_and_navigation
component: company-wide-mbo-screen-inventory-and-navigation


# PRIMARY SCREENS

- mbo_rolldown_tree_screen
- mbo_alignment_map_screen
- mbo_goal_reference_screen
- mbo_checkin_board_screen
- mbo_review_sheet_screen
- mbo_evaluation_support_screen
- mbo_permission_denied_screen


# PRIMARY ENTRY FLOW

company_wide_mbo entry
-> rolldown tree
-> alignment map
-> checkin / review / evaluation subflows

