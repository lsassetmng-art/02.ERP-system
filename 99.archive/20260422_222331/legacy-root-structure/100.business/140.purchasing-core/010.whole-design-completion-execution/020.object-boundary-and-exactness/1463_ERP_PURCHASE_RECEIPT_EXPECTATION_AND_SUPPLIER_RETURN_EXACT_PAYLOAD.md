# ============================================================
# ERP PURCHASE RECEIPT EXPECTATION AND SUPPLIER RETURN EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1463
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase_receipt_expectation_and_supplier_return.exact_payload
component: purchase-receipt-expectation-and-supplier-return-exact-payload


# OBJECT 1

purchase_receipt_expectation

Canonical payload:
- object_id
- company_id
- object_type = purchase_receipt_expectation
- status
- purchase_order_id
- receipt_expectation_code
- expectation_status_code
- expected_receipt_date
- expected_quantity_total
- destination_reference_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

supplier_return_request

Canonical payload:
- object_id
- company_id
- object_type = supplier_return_request
- status
- purchase_order_id
- supplier_return_request_code
- return_status_code
- requested_return_date
- requested_quantity_total
- return_reason_code
- linked_receipt_expectation_id
- created_at
- created_by
- updated_at
- updated_by

