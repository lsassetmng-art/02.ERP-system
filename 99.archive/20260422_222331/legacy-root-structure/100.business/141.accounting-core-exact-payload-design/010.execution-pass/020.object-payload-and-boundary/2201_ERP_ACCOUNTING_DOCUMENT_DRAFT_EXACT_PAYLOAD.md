# ============================================================
# ERP ACCOUNTING DOCUMENT DRAFT EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2201
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting_document_draft.exact_payload
component: accounting-document-draft-exact-payload


# OBJECT

accounting_document_draft

Canonical payload:
- object_id
- company_id
- object_type = accounting_document_draft
- status
- accounting_document_draft_code
- draft_status_code
- document_type_code
- linked_sales_invoice_request_id
- linked_supplier_invoice_intake_id
- draft_currency_code
- draft_total_amount
- draft_date
- approval_state_code
- accounting_owner_reference_code
- created_at
- created_by
- updated_at
- updated_by

