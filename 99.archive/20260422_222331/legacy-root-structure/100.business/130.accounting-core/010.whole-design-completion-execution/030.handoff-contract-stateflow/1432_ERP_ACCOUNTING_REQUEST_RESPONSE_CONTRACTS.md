# ============================================================
# ERP ACCOUNTING REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1432
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.request_response.contracts
component: accounting-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

accounting_journal_entry write:
- posting_date
- source_module_code
- source_object_reference_code
- debit_amount_total
- credit_amount_total
- currency_code

accounting_correction_request write:
- linked_journal_entry_id
- correction_reason_code
- requested_effective_date

accounting_reversal_entry write:
- original_journal_entry_id
- reversal_reason_code
- reversal_effective_date

accounting_close_cycle write:
- fiscal_period_code
- close_scope_code

