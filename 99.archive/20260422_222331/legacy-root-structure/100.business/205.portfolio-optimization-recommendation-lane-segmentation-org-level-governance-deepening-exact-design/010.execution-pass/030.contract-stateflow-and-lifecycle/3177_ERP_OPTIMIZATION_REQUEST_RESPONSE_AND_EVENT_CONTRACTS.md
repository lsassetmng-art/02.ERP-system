# ============================================================
# ERP OPTIMIZATION REQUEST RESPONSE AND EVENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3177
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.optimization.request_response_and_event.contracts
component: optimization-request-response-and-event-contracts


# OFFICIAL OPTIMIZATION EVENT NAMES

- optimization_cycle_started
- optimization_cycle_completed
- lane_assignment_started
- lane_assignment_completed
- org_governance_policy_applied
- governance_exception_opened
- governance_exception_closed
- org_decision_published
- lane_profile_superseded

# MINIMUM CONTRACT FIELDS

- optimization_event_id
- company_id
- linked_portfolio_optimization_profile_id
- linked_recommendation_lane_assignment_case_id
- optimization_contract_type_code
- optimization_contract_version
- optimization_event_type_code
- event_occurred_at
- actor_reference_code
- optimization_status_code
- summary_text

