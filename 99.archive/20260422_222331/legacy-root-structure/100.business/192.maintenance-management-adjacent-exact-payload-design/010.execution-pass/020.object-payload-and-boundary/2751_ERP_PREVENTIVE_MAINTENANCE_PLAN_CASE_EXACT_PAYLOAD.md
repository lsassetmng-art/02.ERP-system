# ============================================================
# ERP PREVENTIVE MAINTENANCE PLAN CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2751
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.preventive_maintenance_plan_case.exact_payload
component: preventive-maintenance-plan-case-exact-payload


# OBJECT

preventive_maintenance_plan_case

Canonical payload:
- object_id
- company_id
- object_type = preventive_maintenance_plan_case
- status
- preventive_maintenance_plan_case_code
- preventive_plan_status_code
- linked_maintenance_asset_reference_id
- maintenance_plan_type_code
- maintenance_frequency_code
- next_due_at
- last_completed_at
- required_skill_code
- estimated_duration_hours
- plan_summary_text
- created_at
- created_by
- updated_at
- updated_by

