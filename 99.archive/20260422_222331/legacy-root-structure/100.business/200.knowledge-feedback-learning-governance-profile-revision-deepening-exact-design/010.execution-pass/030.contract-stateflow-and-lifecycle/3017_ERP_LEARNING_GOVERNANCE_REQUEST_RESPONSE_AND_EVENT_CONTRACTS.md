# ============================================================
# ERP LEARNING GOVERNANCE REQUEST RESPONSE AND EVENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3017
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.learning_governance.request_response_and_event.contracts
component: learning-governance-request-response-and-event-contracts


# OFFICIAL LEARNING EVENT NAMES

- knowledge_feedback_recorded
- validation_started
- validation_completed
- playbook_effectiveness_review_started
- playbook_effectiveness_review_completed
- profile_revision_requested
- revision_decision_completed
- learning_release_published
- supersession_applied
- rollback_release_requested

# MINIMUM CONTRACT FIELDS

- learning_event_id
- company_id
- linked_feedback_record_id
- linked_revision_request_id
- learning_contract_type_code
- learning_contract_version
- learning_event_type_code
- event_occurred_at
- actor_reference_code
- learning_status_code
- summary_text

