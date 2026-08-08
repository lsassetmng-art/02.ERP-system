# ============================================================
# ERP VARIANCE ANALYSIS AND MANAGEMENT DASHBOARD SNAPSHOT EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2468
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.variance_analysis_and_management_dashboard_snapshot.exact_payload
component: variance-analysis-and-management-dashboard-snapshot-exact-payload


# OBJECT 1

variance_analysis_snapshot

Canonical payload:
- object_id
- company_id
- object_type = variance_analysis_snapshot
- status
- variance_analysis_snapshot_code
- variance_status_code
- linked_budget_coordination_case_id
- linked_forecast_coordination_case_id
- snapshot_period_code
- actual_value_amount
- baseline_value_amount
- variance_amount
- variance_reason_summary_text
- snapped_at
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

management_dashboard_snapshot

Canonical payload:
- object_id
- company_id
- object_type = management_dashboard_snapshot
- status
- management_dashboard_snapshot_code
- dashboard_status_code
- dashboard_scope_code
- snapshot_period_code
- linked_variance_analysis_snapshot_id
- kpi_summary_text
- alert_count
- trend_direction_code
- snapped_at
- created_at
- created_by
- updated_at
- updated_by

