# ============================================================
# ERP PURCHASE REQUEST EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2137
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
- requesting_department_reference_code
- requester_reference_code
- requested_supplier_reference_code
- request_date
- requested_receipt_date
- currency_code
- subtotal_amount
- tax_amount
- total_amount
- request_reason_code
- created_at
- created_by
- updated_at
- updated_by

