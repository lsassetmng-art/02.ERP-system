# ============================================================
# ERP MAINTENANCE DOWNTIME EVENT CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2753
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_downtime_event_case.exact_payload
component: maintenance-downtime-event-case-exact-payload


# OBJECT

maintenance_downtime_event_case

Canonical payload:
- object_id
- company_id
- object_type = maintenance_downtime_event_case
- status
- maintenance_downtime_event_case_code
- downtime_status_code
- linked_maintenance_asset_reference_id
- linked_maintenance_execution_case_id
- linked_work_center_reference_code
- downtime_reason_code
- downtime_start_at
- downtime_end_at
- downtime_duration_minutes
- downtime_summary_text
- created_at
- created_by
- updated_at
- updated_by

