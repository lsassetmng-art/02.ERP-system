# ============================================================
# ERP PORTFOLIO REQUEST RESPONSE AND EVENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3145
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.portfolio.request_response_and_event.contracts
component: portfolio-request-response-and-event-contracts


# OFFICIAL PORTFOLIO EVENT NAMES

- portfolio_selection_started
- portfolio_selection_completed
- arbitration_started
- arbitration_completed
- enterprise_rollout_policy_applied
- tenant_override_requested
- tenant_override_applied
- tenant_override_rejected
- portfolio_exception_opened
- portfolio_profile_superseded

# MINIMUM CONTRACT FIELDS

- portfolio_event_id
- company_id
- linked_recommendation_portfolio_profile_id
- linked_multi_profile_arbitration_case_id
- portfolio_contract_type_code
- portfolio_contract_version
- portfolio_event_type_code
- event_occurred_at
- actor_reference_code
- portfolio_status_code
- summary_text

