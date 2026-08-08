# ============================================================
# ERP WAREHOUSE EXCEPTION CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2630
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.warehouse_exception_case.exact_payload
component: warehouse-exception-case-exact-payload


# OBJECT

warehouse_exception_case

Canonical payload:
- object_id
- company_id
- object_type = warehouse_exception_case
- status
- warehouse_exception_case_code
- exception_status_code
- linked_warehouse_task_case_id
- exception_type_code
- exception_severity_code
- affected_item_reference_code
- affected_quantity
- exception_occurred_at
- resolution_state_code
- exception_summary_text
- created_at
- created_by
- updated_at
- updated_by

