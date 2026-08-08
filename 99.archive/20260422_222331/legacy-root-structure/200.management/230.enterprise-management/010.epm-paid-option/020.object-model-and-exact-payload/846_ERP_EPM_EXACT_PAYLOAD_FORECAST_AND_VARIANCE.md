# ============================================================
# ERP EPM EXACT PAYLOAD FORECAST AND VARIANCE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-846
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.exact_payload.forecast_and_variance
component: epm-exact-payload-forecast-and-variance


# OBJECT 1

epm_forecast_record

Canonical payload:
- object_id
- company_id
- object_type = epm_forecast_record
- status
- linked_plan_cycle_id
- linked_objective_id
- linked_kpi_id
- forecast_status_code
- forecast_value
- forecast_window_code
- forecast_basis_code
- forecast_recorded_at
- recorded_by
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

epm_variance_record

Canonical payload:
- object_id
- company_id
- object_type = epm_variance_record
- status
- linked_plan_cycle_id
- linked_objective_id
- linked_kpi_id
- variance_status_code
- baseline_value
- actual_value
- variance_value
- variance_reason_code
- variance_recorded_at
- recorded_by
- created_at
- created_by
- updated_at
- updated_by


# RULE

Forecast is forward-looking interpretation.
Variance is baseline-vs-actual interpretation.
They must not be flattened into one record.

