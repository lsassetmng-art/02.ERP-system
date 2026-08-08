# ============================================================
# ERP THRESHOLD DECAY AUTOMATION SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3314
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.threshold_decay_automation.screen_inventory_and_navigation
component: threshold-decay-automation-screen-inventory-and-navigation


# PRIMARY SCREENS

- drift_threshold_tuning_profile_viewer_screen
- delegation_trust_decay_profile_viewer_screen
- drift_threshold_tuning_session_queue_screen
- trust_decay_evaluation_case_queue_screen
- audit_escalation_automation_case_viewer_screen
- threshold_decay_automation_permission_denied_screen

# PRIMARY ENTRY FLOW

threshold decay automation entry
-> threshold / decay
-> automation / summary
-> decision / audit

