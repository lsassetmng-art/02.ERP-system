# ============================================================
# ERP ACCOUNTING REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2212
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.request_response.contracts
component: accounting-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

accounting_document_draft write:
- document_type_code
- linked_sales_invoice_request_id
- linked_supplier_invoice_intake_id
- draft_currency_code
- draft_total_amount
- draft_date
- approval_state_code

journal_batch write:
- batch_type_code
- linked_accounting_document_draft_id
- posting_date
- batch_currency_code
- batch_total_amount
- source_reference_code

receivable_payable_position write:
- linked_journal_batch_id
- counterparty_reference_code
- due_date
- open_amount
- settled_amount
- balance_amount
- settlement_status_code

close_cycle write:
- fiscal_period_code
- close_scope_code
- opening_at
- cutoff_at
- close_owner_reference_code
- variance_review_state_code

accounting_correction_case write:
- linked_accounting_document_draft_id
- linked_journal_batch_id
- linked_receivable_payable_position_id
- linked_close_cycle_id
- correction_reason_code
- correction_requested_at

