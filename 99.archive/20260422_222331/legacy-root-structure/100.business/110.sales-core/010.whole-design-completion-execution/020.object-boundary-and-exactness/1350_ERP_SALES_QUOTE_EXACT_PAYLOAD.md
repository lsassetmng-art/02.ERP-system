# ============================================================
# ERP SALES QUOTE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1350
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.quote.exact_payload
component: sales-quote-exact-payload


# OBJECT

sales_quote

Canonical payload:
- object_id
- company_id
- object_type = sales_quote
- status
- quote_code
- customer_reference_code
- quote_status_code
- issue_date
- expiry_date
- currency_code
- quoted_amount_total
- tax_amount_total
- discount_amount_total
- linked_opportunity_reference_code
- created_at
- created_by
- updated_at
- updated_by

