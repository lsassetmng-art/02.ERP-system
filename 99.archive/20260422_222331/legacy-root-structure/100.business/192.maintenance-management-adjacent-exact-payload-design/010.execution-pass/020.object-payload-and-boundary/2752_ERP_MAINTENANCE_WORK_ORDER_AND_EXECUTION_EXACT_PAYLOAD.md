# ============================================================
# ERP MAINTENANCE WORK ORDER AND EXECUTION EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2752
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_work_order_and_execution.exact_payload
component: maintenance-work-order-and-execution-exact-payload


# OBJECT 1

maintenance_work_order_case

Canonical payload:
- object_id
- company_id
- object_type = maintenance_work_order_case
- status
- maintenance_work_order_case_code
- work_order_status_code
- linked_preventive_maintenance_plan_case_id
- linked_maintenance_asset_reference_id
- work_order_type_code
- priority_code
- scheduled_start_at
- scheduled_end_at
- assigned_team_reference_code
- spare_part_requirement_summary_text
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

maintenance_execution_case

Canonical payload:
- object_id
- company_id
- object_type = maintenance_execution_case
- status
- maintenance_execution_case_code
- maintenance_execution_status_code
- linked_maintenance_work_order_case_id
- execution_start_at
- execution_end_at
- labor_hours_spent
- spare_part_issue_summary_text
- maintenance_result_code
- execution_summary_text
- created_at
- created_by
- updated_at
- updated_by

