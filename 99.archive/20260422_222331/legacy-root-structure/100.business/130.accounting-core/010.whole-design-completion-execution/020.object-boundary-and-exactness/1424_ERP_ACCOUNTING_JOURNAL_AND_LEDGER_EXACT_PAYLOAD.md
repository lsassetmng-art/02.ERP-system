# ============================================================
# ERP ACCOUNTING JOURNAL AND LEDGER EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1424
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.journal_and_ledger.exact_payload
component: accounting-journal-and-ledger-exact-payload


# OBJECT 1

accounting_journal_entry

Canonical payload:
- object_id
- company_id
- object_type = accounting_journal_entry
- status
- journal_entry_code
- posting_date
- journal_status_code
- source_module_code
- source_object_reference_code
- debit_amount_total
- credit_amount_total
- currency_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

accounting_ledger_posting

Canonical payload:
- object_id
- company_id
- object_type = accounting_ledger_posting
- status
- ledger_posting_code
- journal_entry_id
- ledger_status_code
- ledger_account_code
- debit_amount
- credit_amount
- posting_effective_date
- created_at
- created_by
- updated_at
- updated_by

