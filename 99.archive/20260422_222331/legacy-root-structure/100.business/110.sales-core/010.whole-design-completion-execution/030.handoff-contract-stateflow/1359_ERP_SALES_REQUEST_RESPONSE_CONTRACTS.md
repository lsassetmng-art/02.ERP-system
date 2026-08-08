# ============================================================
# ERP SALES REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1359
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.request_response.contracts
component: sales-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

sales_quote write:
- customer_reference_code
- issue_date
- expiry_date
- currency_code
- quoted_amount_total
- tax_amount_total
- discount_amount_total
- linked_opportunity_reference_code

sales_order write:
- customer_reference_code
- order_date
- promised_ship_date
- currency_code
- order_amount_total
- tax_amount_total
- linked_quote_id

sales_billing_instruction write:
- sales_order_id
- billable_amount_total
- billing_basis_code
- billing_release_date

sales_return_request write:
- sales_order_id
- requested_return_date
- requested_quantity_total
- return_reason_code
- linked_billing_instruction_id

