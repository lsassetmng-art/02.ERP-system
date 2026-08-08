# ============================================================
# ERP EPM PAID OPTION REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2475
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm_paid_option.request_response.contracts
component: epm-paid-option-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

performance_plan_case write:
- planning_scope_code
- planning_period_code
- plan_owner_reference_code
- planning_basis_code
- target_value_amount
- target_value_unit_code
- plan_summary_text

budget_coordination_case write:
- linked_performance_plan_case_id
- budget_period_code
- budget_scope_code
- budget_owner_reference_code
- requested_budget_amount
- approved_budget_amount
- coordination_summary_text

forecast_coordination_case write:
- linked_performance_plan_case_id
- forecast_period_code
- forecast_scope_code
- forecast_owner_reference_code
- forecast_amount
- forecast_confidence_percent
- forecast_summary_text

variance_analysis_snapshot write:
- linked_budget_coordination_case_id
- linked_forecast_coordination_case_id
- snapshot_period_code
- actual_value_amount
- baseline_value_amount
- variance_amount
- variance_reason_summary_text
- snapped_at

management_dashboard_snapshot write:
- dashboard_scope_code
- snapshot_period_code
- linked_variance_analysis_snapshot_id
- kpi_summary_text
- alert_count
- trend_direction_code
- snapped_at

