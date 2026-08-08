# ============================================================
# ERP FORECAST COORDINATION CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2467
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.forecast_coordination_case.exact_payload
component: forecast-coordination-case-exact-payload


# OBJECT

forecast_coordination_case

Canonical payload:
- object_id
- company_id
- object_type = forecast_coordination_case
- status
- forecast_coordination_case_code
- forecast_status_code
- linked_performance_plan_case_id
- forecast_period_code
- forecast_scope_code
- forecast_owner_reference_code
- forecast_amount
- forecast_confidence_percent
- forecast_summary_text
- created_at
- created_by
- updated_at
- updated_by

