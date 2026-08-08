# ============================================================
# ERP EPM FORECAST VARIANCE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-852
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.forecast_variance_contracts
component: epm-forecast-variance-contracts


# FORECAST WRITE REQUEST BODY

- linked_plan_cycle_id
- linked_objective_id
- linked_kpi_id
- forecast_status_code
- forecast_value
- forecast_window_code
- forecast_basis_code


# VARIANCE WRITE REQUEST BODY

- linked_plan_cycle_id
- linked_objective_id
- linked_kpi_id
- variance_status_code
- baseline_value
- actual_value
- variance_value
- variance_reason_code


# RULE

Forecast write and variance write must remain distinct.

