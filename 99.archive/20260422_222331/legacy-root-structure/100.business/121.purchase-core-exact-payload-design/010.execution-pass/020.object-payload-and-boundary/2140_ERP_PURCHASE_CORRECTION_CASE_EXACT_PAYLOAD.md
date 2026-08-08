# ============================================================
# ERP PURCHASE CORRECTION CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2140
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase_correction_case.exact_payload
component: purchase-correction-case-exact-payload


# OBJECT

purchase_correction_case

Canonical payload:
- object_id
- company_id
- object_type = purchase_correction_case
- status
- purchase_correction_case_code
- correction_status_code
- linked_purchase_request_id
- linked_purchase_order_id
- linked_receipt_expectation_id
- linked_supplier_invoice_intake_id
- correction_reason_code
- correction_requested_at
- correction_approval_state_code
- created_at
- created_by
- updated_at
- updated_by

