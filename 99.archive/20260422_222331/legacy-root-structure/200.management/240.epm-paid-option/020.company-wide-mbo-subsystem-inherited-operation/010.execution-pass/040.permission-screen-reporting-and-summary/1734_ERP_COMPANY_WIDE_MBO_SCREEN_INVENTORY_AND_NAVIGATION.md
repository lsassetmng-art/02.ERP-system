# ============================================================
# ERP COMPANY WIDE MBO SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1734
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo.screen_inventory_and_navigation
component: company-wide-mbo-screen-inventory-and-navigation


# PRIMARY SCREENS

- company_wide_mbo_program_screen
- company_wide_mbo_objective_cascade_screen
- company_wide_mbo_assignment_record_screen
- company_wide_mbo_progress_review_screen
- company_wide_mbo_evaluation_support_case_screen
- company_wide_mbo_permission_denied_screen

# PRIMARY ENTRY FLOW

company_wide_mbo entry
-> program / cascade
-> assignment / progress review
-> evaluation support subflows

