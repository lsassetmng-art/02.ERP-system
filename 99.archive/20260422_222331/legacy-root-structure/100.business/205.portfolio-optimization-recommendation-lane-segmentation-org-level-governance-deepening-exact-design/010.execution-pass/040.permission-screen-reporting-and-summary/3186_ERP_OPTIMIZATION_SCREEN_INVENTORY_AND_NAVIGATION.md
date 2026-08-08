# ============================================================
# ERP OPTIMIZATION SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3186
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.optimization.screen_inventory_and_navigation
component: optimization-screen-inventory-and-navigation


# PRIMARY SCREENS

- portfolio_optimization_profile_viewer_screen
- recommendation_lane_segmentation_profile_viewer_screen
- optimization_cycle_case_queue_screen
- recommendation_lane_assignment_case_queue_screen
- governance_exception_case_viewer_screen
- optimization_permission_denied_screen

# PRIMARY ENTRY FLOW

optimization entry
-> optimization / lane
-> org governance / exception
-> decision / audit

