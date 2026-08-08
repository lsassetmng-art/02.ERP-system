# ============================================================
# ERP LEARNING GOVERNANCE SCREEN INVENTORY AND NAVIGATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3026
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.learning_governance.screen_inventory_and_navigation
component: learning-governance-screen-inventory-and-navigation


# PRIMARY SCREENS

- knowledge_feedback_record_queue_screen
- knowledge_validation_case_viewer_screen
- playbook_effectiveness_review_queue_screen
- profile_revision_request_queue_screen
- revision_decision_and_release_bundle_viewer_screen
- learning_governance_permission_denied_screen

# PRIMARY ENTRY FLOW

learning governance entry
-> feedback / validation
-> review / revision
-> release / audit

