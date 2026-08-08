# ============================================================
# ERP THRESHOLD DECAY AUTOMATION REQUEST RESPONSE AND EVENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3305
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.threshold_decay_automation.request_response_and_event.contracts
component: threshold-decay-automation-request-response-and-event-contracts


# OFFICIAL EVENT NAMES

- threshold_tuning_started
- threshold_tuning_completed
- trust_decay_evaluation_started
- trust_decay_evaluation_completed
- audit_escalation_automation_started
- audit_escalation_automation_completed
- automation_closure_completed
- threshold_profile_superseded
- decay_profile_rebased

# MINIMUM CONTRACT FIELDS

- threshold_decay_automation_event_id
- company_id
- linked_drift_threshold_tuning_session_id
- linked_audit_escalation_automation_case_id
- contract_type_code
- contract_version
- event_type_code
- event_occurred_at
- actor_reference_code
- status_code
- summary_text

