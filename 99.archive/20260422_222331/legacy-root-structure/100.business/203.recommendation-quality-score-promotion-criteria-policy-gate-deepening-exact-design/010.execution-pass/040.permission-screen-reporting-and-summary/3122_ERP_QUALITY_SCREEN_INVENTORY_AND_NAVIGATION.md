# ============================================================
# ERP QUALITY SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3122
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality.screen_inventory_and_navigation
component: quality-screen-inventory-and-navigation


# PRIMARY SCREENS

- recommendation_quality_score_viewer_screen
- promotion_criteria_profile_viewer_screen
- policy_gate_profile_viewer_screen
- promotion_evaluation_case_queue_screen
- policy_gate_decision_queue_screen
- quality_permission_denied_screen

# PRIMARY ENTRY FLOW

quality entry
-> quality / criteria
-> gate / evaluation
-> decision / audit

