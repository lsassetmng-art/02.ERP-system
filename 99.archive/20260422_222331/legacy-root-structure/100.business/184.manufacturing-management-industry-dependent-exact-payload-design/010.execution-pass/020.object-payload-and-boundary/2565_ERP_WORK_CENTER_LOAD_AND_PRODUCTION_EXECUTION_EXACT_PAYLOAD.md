# ============================================================
# ERP WORK CENTER LOAD AND PRODUCTION EXECUTION EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2565
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.work_center_load_and_production_execution.exact_payload
component: work-center-load-and-production-execution-exact-payload


# OBJECT 1

work_center_load_case

Canonical payload:
- object_id
- company_id
- object_type = work_center_load_case
- status
- work_center_load_case_code
- load_status_code
- linked_production_order_case_id
- work_center_reference_code
- load_start_at
- load_end_at
- planned_capacity_hours
- allocated_capacity_hours
- overload_flag
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

production_execution_case

Canonical payload:
- object_id
- company_id
- object_type = production_execution_case
- status
- production_execution_case_code
- execution_status_code
- linked_production_order_case_id
- linked_work_center_load_case_id
- execution_start_at
- execution_end_at
- executed_quantity
- rejected_quantity
- execution_summary_text
- created_at
- created_by
- updated_at
- updated_by

