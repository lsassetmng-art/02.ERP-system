# ============================================================
# ERP CALIBRATION SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3058
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.calibration.screen_inventory_and_navigation
component: calibration-screen-inventory-and-navigation


# PRIMARY SCREENS

- knowledge_freshness_policy_viewer_screen
- evidence_weighting_profile_viewer_screen
- recommendation_calibration_profile_viewer_screen
- calibration_evaluation_case_queue_screen
- recommendation_evidence_bundle_viewer_screen
- calibration_permission_denied_screen

# PRIMARY ENTRY FLOW

calibration entry
-> freshness / weighting
-> calibration / evaluation
-> evidence bundle / audit

