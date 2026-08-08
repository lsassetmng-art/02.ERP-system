# ============================================================
# ERP EPM REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1688
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm.request_response.contracts
component: epm-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

epm_objective_set write:
- objective_horizon_code
- effective_from
- effective_to
- owner_role_code
- linked_management_reference_code

epm_kpi_metric write:
- linked_objective_set_id
- metric_formula_code
- target_value
- target_unit_code
- measurement_frequency_code

epm_scorecard_snapshot write:
- linked_objective_set_id
- snapshot_period_code
- aggregated_score_value
- linked_actuals_reference_code
- published_at

epm_planning_review_cycle write:
- cycle_type_code
- plan_period_code
- review_period_code
- scheduled_open_at
- scheduled_close_at

epm_variance_case write:
- linked_kpi_metric_id
- linked_scorecard_snapshot_id
- variance_reason_code
- detected_at
- action_owner_role_code

