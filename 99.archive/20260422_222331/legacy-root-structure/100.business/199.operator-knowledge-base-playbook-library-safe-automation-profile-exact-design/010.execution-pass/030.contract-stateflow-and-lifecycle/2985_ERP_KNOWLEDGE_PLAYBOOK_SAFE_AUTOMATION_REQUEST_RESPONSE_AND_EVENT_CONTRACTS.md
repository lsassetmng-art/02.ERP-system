# ============================================================
# ERP KNOWLEDGE PLAYBOOK SAFE AUTOMATION REQUEST RESPONSE AND EVENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2985
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.knowledge_playbook_safe_automation.request_response_and_event.contracts
component: knowledge-playbook-safe-automation-request-response-and-event-contracts


# OFFICIAL KNOWLEDGE EVENT NAMES

- knowledge_article_selected
- playbook_recommended
- runbook_activation_recommended
- safe_automation_profile_matched
- automation_constraint_evaluated
- knowledge_feedback_recorded
- profile_revision_requested
- profile_revision_applied

# MINIMUM CONTRACT FIELDS

- knowledge_event_id
- company_id
- linked_incident_case_id
- linked_incident_runbook_case_id
- knowledge_contract_type_code
- knowledge_contract_version
- knowledge_event_type_code
- event_occurred_at
- actor_reference_code
- knowledge_status_code
- summary_text

