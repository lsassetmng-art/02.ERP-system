# ============================================================
# ERP SALES CORRECTION CASE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2108
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_correction_case.exact_payload
component: sales-correction-case-exact-payload


# OBJECT

sales_correction_case

Canonical payload:
- object_id
- company_id
- object_type = sales_correction_case
- status
- sales_correction_case_code
- correction_status_code
- linked_sales_quote_id
- linked_sales_order_id
- linked_fulfillment_instruction_id
- linked_sales_invoice_request_id
- correction_reason_code
- correction_requested_at
- correction_approval_state_code
- created_at
- created_by
- updated_at
- updated_by

