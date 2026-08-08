# ============================================================
# ERP SALES REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2115
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.request_response.contracts
component: sales-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

sales_quote write:
- customer_reference_code
- quote_issue_date
- quote_expire_date
- currency_code
- subtotal_amount
- tax_amount
- total_amount

sales_order write:
- customer_reference_code
- linked_sales_quote_id
- order_date
- requested_ship_date
- promised_delivery_date
- order_total_amount

sales_fulfillment_instruction write:
- linked_sales_order_id
- requested_warehouse_reference_code
- requested_ship_date
- allocation_required_flag
- fulfillment_priority_code

sales_invoice_request write:
- linked_sales_order_id
- linked_fulfillment_instruction_id
- invoice_basis_code
- bill_to_reference_code
- invoice_requested_at

sales_correction_case write:
- linked_sales_quote_id
- linked_sales_order_id
- linked_fulfillment_instruction_id
- linked_sales_invoice_request_id
- correction_reason_code
- correction_requested_at

