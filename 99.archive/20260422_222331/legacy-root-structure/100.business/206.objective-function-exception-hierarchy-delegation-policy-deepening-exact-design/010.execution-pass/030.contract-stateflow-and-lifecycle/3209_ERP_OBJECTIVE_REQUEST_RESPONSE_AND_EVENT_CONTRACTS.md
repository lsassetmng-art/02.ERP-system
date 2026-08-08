# ============================================================
# ERP OBJECTIVE REQUEST RESPONSE AND EVENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3209
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.objective.request_response_and_event.contracts
component: objective-request-response-and-event-contracts


# OFFICIAL OBJECTIVE EVENT NAMES

- objective_evaluation_started
- objective_evaluation_completed
- exception_routing_started
- exception_routing_completed
- delegation_decision_requested
- delegation_decision_completed
- delegation_applied
- escalation_closed
- delegation_policy_superseded

# MINIMUM CONTRACT FIELDS

- objective_event_id
- company_id
- linked_objective_evaluation_case_id
- linked_delegation_decision_case_id
- objective_contract_type_code
- objective_contract_version
- objective_event_type_code
- event_occurred_at
- actor_reference_code
- objective_status_code
- summary_text

