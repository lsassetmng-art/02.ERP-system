# ============================================================
# ERP DRIFT TRUST AUDIT SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3282
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.drift_trust_audit.screen_inventory_and_navigation
component: drift-trust-audit-screen-inventory-and-navigation


# PRIMARY SCREENS

- objective_drift_control_profile_viewer_screen
- delegation_trust_scoring_profile_viewer_screen
- drift_assessment_case_queue_screen
- delegation_trust_evaluation_case_queue_screen
- override_audit_pack_case_viewer_screen
- drift_trust_audit_permission_denied_screen

# PRIMARY ENTRY FLOW

drift trust audit entry
-> drift / trust
-> audit pack / summary
-> decision / audit

