# ============================================================
# ERP QUALITY REQUEST RESPONSE AND EVENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3113
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality.request_response_and_event.contracts
component: quality-request-response-and-event-contracts


# OFFICIAL QUALITY EVENT NAMES

- recommendation_quality_scored
- promotion_evaluation_started
- promotion_evaluation_completed
- policy_gate_decision_requested
- policy_gate_decision_completed
- promotion_hold_applied
- promotion_rejected
- promotion_approved
- rollback_hold_applied

# MINIMUM CONTRACT FIELDS

- quality_event_id
- company_id
- linked_promotion_evaluation_case_id
- linked_policy_gate_decision_case_id
- quality_contract_type_code
- quality_contract_version
- quality_event_type_code
- event_occurred_at
- actor_reference_code
- quality_status_code
- summary_text

