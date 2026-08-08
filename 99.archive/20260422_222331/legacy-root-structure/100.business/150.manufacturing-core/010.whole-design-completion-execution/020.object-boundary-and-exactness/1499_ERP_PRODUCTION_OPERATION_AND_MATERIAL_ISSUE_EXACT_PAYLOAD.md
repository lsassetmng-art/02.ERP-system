# ============================================================
# ERP PRODUCTION OPERATION AND MATERIAL ISSUE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1499
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.production_operation_and_material_issue.exact_payload
component: production-operation-and-material-issue-exact-payload


# OBJECT 1

production_operation

Canonical payload:
- object_id
- company_id
- object_type = production_operation
- status
- production_order_id
- operation_no
- operation_status_code
- work_center_reference_code
- planned_start_at
- planned_end_at
- actual_start_at
- actual_end_at
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

manufacturing_material_issue_request

Canonical payload:
- object_id
- company_id
- object_type = manufacturing_material_issue_request
- status
- production_order_id
- issue_request_code
- issue_status_code
- item_reference_code
- requested_issue_quantity
- requested_issue_date
- issue_basis_code
- created_at
- created_by
- updated_at
- updated_by

