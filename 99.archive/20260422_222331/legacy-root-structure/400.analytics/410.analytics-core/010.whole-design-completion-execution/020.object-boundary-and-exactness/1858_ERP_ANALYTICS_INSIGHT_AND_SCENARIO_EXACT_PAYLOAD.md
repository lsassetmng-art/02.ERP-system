# ============================================================
# ERP ANALYTICS INSIGHT AND SCENARIO EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1858
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics.insight_and_scenario.exact_payload
component: analytics-insight-and-scenario-exact-payload


# OBJECT 1

analytics_insight_record

Canonical payload:
- object_id
- company_id
- object_type = analytics_insight_record
- status
- insight_record_code
- insight_status_code
- linked_view_snapshot_id
- insight_type_code
- insight_severity_code
- generated_at
- insight_summary_text
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

analytics_scenario_snapshot

Canonical payload:
- object_id
- company_id
- object_type = analytics_scenario_snapshot
- status
- scenario_snapshot_code
- scenario_status_code
- linked_dataset_model_id
- scenario_type_code
- scenario_period_code
- scenario_parameter_reference_code
- calculated_at
- created_at
- created_by
- updated_at
- updated_by

