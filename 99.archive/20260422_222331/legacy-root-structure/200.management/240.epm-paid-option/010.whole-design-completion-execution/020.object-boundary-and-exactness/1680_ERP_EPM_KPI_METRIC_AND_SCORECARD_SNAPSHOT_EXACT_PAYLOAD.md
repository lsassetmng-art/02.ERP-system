# ============================================================
# ERP EPM KPI METRIC AND SCORECARD SNAPSHOT EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1680
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm.kpi_metric_and_scorecard_snapshot.exact_payload
component: epm-kpi-metric-and-scorecard-snapshot-exact-payload


# OBJECT 1

epm_kpi_metric

Canonical payload:
- object_id
- company_id
- object_type = epm_kpi_metric
- status
- kpi_metric_code
- kpi_status_code
- linked_objective_set_id
- metric_formula_code
- target_value
- target_unit_code
- measurement_frequency_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

epm_scorecard_snapshot

Canonical payload:
- object_id
- company_id
- object_type = epm_scorecard_snapshot
- status
- scorecard_snapshot_code
- scorecard_status_code
- linked_objective_set_id
- snapshot_period_code
- aggregated_score_value
- linked_actuals_reference_code
- published_at
- created_at
- created_by
- updated_at
- updated_by

