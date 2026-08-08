# ============================================================
# ERP PURCHASE REQUEST EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1461
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase_request.exact_payload
component: purchase-request-exact-payload


# OBJECT

purchase_request

Canonical payload:
- object_id
- company_id
- object_type = purchase_request
- status
- purchase_request_code
- request_status_code
- request_date
- requested_need_date
- requesting_department_reference_code
- item_reference_code
- requested_quantity
- requested_unit_of_measure_code
- request_reason_code
- created_at
- created_by
- updated_at
- updated_by

