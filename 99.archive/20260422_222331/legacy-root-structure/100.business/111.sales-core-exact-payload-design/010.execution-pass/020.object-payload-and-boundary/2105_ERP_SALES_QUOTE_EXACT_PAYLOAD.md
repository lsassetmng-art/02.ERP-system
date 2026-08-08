# ============================================================
# ERP SALES QUOTE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2105
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_quote.exact_payload
component: sales-quote-exact-payload


# OBJECT

sales_quote

Canonical payload:
- object_id
- company_id
- object_type = sales_quote
- status
- sales_quote_code
- quote_status_code
- customer_reference_code
- quote_issue_date
- quote_expire_date
- currency_code
- subtotal_amount
- tax_amount
- total_amount
- sales_owner_reference_code
- linked_source_request_code
- created_at
- created_by
- updated_at
- updated_by

