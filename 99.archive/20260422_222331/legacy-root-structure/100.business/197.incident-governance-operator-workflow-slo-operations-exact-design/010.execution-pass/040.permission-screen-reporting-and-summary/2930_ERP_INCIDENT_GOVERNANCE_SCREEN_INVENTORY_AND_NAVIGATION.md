# ============================================================
# ERP INCIDENT GOVERNANCE SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2930
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.incident_governance.screen_inventory_and_navigation
component: incident-governance-screen-inventory-and-navigation


# PRIMARY SCREENS

- incident_case_queue_screen
- operator_work_item_queue_screen
- escalation_decision_viewer_screen
- slo_review_queue_screen
- suppression_override_viewer_screen
- postincident_review_viewer_screen
- incident_governance_permission_denied_screen

# PRIMARY ENTRY FLOW

incident governance entry
-> incident / operator queue
-> escalation / slo review
-> suppression / postincident review

