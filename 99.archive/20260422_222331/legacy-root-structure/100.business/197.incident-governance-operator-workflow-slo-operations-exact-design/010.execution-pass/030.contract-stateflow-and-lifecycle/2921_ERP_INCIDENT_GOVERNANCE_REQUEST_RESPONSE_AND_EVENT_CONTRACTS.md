# ============================================================
# ERP INCIDENT GOVERNANCE REQUEST RESPONSE AND EVENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2921
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.incident_governance.request_response_and_event.contracts
component: incident-governance-request-response-and-event-contracts


# OFFICIAL GOVERNANCE EVENT NAMES

- incident_opened
- triage_started
- operator_assigned
- operator_acknowledged
- escalation_decided
- slo_review_started
- slo_review_completed
- suppression_override_applied
- postincident_review_started
- postincident_review_completed
- incident_closed

# MINIMUM CONTRACT FIELDS

- governance_event_id
- company_id
- linked_incident_case_id
- linked_operator_work_item_id
- governance_contract_type_code
- governance_contract_version
- governance_event_type_code
- event_occurred_at
- actor_reference_code
- governance_status_code
- summary_text

