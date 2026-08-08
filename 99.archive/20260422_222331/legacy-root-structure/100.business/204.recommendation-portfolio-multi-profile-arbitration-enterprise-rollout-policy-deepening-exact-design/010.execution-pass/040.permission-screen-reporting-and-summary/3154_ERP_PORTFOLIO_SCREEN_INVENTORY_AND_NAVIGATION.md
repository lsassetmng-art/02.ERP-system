# ============================================================
# ERP PORTFOLIO SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3154
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.portfolio.screen_inventory_and_navigation
component: portfolio-screen-inventory-and-navigation


# PRIMARY SCREENS

- recommendation_portfolio_profile_viewer_screen
- multi_profile_arbitration_case_queue_screen
- enterprise_rollout_policy_profile_viewer_screen
- tenant_override_policy_case_queue_screen
- arbitration_evidence_summary_viewer_screen
- portfolio_permission_denied_screen

# PRIMARY ENTRY FLOW

portfolio entry
-> portfolio / arbitration
-> enterprise policy / tenant override
-> evidence / audit

