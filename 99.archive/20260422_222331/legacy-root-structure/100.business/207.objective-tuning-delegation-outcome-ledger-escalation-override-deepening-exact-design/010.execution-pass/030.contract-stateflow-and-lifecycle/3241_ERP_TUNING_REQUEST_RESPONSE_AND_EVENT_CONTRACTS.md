# ============================================================
# ERP TUNING REQUEST RESPONSE AND EVENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3241
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.tuning.request_response_and_event.contracts
component: tuning-request-response-and-event-contracts


# OFFICIAL TUNING EVENT NAMES

- tuning_session_started
- tuning_session_completed
- delegation_outcome_recorded
- override_requested
- override_decision_completed
- override_applied
- override_closed
- tuning_profile_superseded
- tuning_rollback_requested

# MINIMUM CONTRACT FIELDS

- tuning_event_id
- company_id
- linked_objective_tuning_session_id
- linked_escalation_override_decision_case_id
- tuning_contract_type_code
- tuning_contract_version
- tuning_event_type_code
- event_occurred_at
- actor_reference_code
- tuning_status_code
- summary_text

