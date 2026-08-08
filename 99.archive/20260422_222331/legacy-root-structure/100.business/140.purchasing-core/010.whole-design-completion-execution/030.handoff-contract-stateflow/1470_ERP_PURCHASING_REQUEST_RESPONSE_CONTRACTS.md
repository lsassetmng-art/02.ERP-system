# ============================================================
# ERP PURCHASING REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1470
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchasing.request_response.contracts
component: purchasing-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

purchase_request write:
- request_date
- requested_need_date
- requesting_department_reference_code
- item_reference_code
- requested_quantity
- requested_unit_of_measure_code
- request_reason_code

purchase_order write:
- supplier_reference_code
- order_date
- promised_receipt_date
- currency_code
- order_amount_total
- tax_amount_total
- linked_purchase_request_id

purchase_receipt_expectation write:
- purchase_order_id
- expected_receipt_date
- expected_quantity_total
- destination_reference_code

supplier_return_request write:
- purchase_order_id
- requested_return_date
- requested_quantity_total
- return_reason_code
- linked_receipt_expectation_id

