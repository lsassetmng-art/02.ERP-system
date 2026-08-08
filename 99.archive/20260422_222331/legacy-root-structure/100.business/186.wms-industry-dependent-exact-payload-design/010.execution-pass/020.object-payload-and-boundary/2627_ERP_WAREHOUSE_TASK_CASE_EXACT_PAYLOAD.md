# ============================================================
# ERP WAREHOUSE TASK CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2627
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.warehouse_task_case.exact_payload
component: warehouse-task-case-exact-payload


# OBJECT

warehouse_task_case

Canonical payload:
- object_id
- company_id
- object_type = warehouse_task_case
- status
- warehouse_task_case_code
- warehouse_task_status_code
- task_type_code
- linked_sales_fulfillment_reference_code
- linked_purchase_receipt_reference_code
- linked_scm_transfer_reference_code
- warehouse_reference_code
- task_owner_reference_code
- scheduled_start_at
- scheduled_end_at
- task_priority_code
- created_at
- created_by
- updated_at
- updated_by

