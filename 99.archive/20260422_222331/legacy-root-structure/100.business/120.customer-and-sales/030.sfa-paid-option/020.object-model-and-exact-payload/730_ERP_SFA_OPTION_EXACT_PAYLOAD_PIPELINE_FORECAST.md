# ============================================================
# ERP SFA OPTION EXACT PAYLOAD PIPELINE FORECAST
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-730
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.exact_payload.pipeline_forecast
component: sfa-option-exact-payload-pipeline-forecast


# OBJECT

sfa_pipeline_forecast_snapshot


# CANONICAL PAYLOAD

- object_id
- company_id
- object_type = sfa_pipeline_forecast_snapshot
- status
- pipeline_code
- snapshot_at
- owner_scope_code
- forecast_window_code
- total_pipeline_amount
- weighted_pipeline_amount
- opportunity_count
- derived_from_stage_set
- derived_from_forecast_bucket_set
- created_at
- created_by


# RULE

Forecast snapshot is derived SFA analytical truth.
It is not the same as underlying opportunity truth.

