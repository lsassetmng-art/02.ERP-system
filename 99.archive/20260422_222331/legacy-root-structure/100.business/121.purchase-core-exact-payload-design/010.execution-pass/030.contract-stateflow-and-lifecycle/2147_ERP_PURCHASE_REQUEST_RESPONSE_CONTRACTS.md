# ============================================================
# ERP PURCHASE REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2147
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase.request_response.contracts
component: purchase-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

purchase_request write:
- requesting_department_reference_code
- requester_reference_code
- requested_supplier_reference_code
- request_date
- requested_receipt_date
- subtotal_amount
- tax_amount
- total_amount
- request_reason_code

purchase_order write:
- supplier_reference_code
- linked_purchase_request_id
- order_date
- promised_receipt_date
- order_total_amount

receipt_expectation write:
- linked_purchase_order_id
- expected_receiving_location_reference_code
- expected_receipt_date
- receiving_priority_code

supplier_invoice_intake write:
- linked_purchase_order_id
- linked_receipt_expectation_id
- supplier_invoice_reference_code
- payable_basis_code
- bill_from_reference_code
- invoice_received_at

purchase_correction_case write:
- linked_purchase_request_id
- linked_purchase_order_id
- linked_receipt_expectation_id
- linked_supplier_invoice_intake_id
- correction_reason_code
- correction_requested_at

