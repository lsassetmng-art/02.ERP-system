# ============================================================
# ACCOUNTING MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 30.accounting

## 1. Canonical entities
- acc_journal_entry
- acc_journal_line
- acc_receivable_ledger
- acc_payable_ledger
- acc_settlement
- acc_period_control
- acc_suspense_record

## 2. Key fields
acc_journal_entry:
- acc_journal_entry_id
- journal_number
- posting_date
- period_id
- posting_status
- source_module
- source_reference_id
- currency_code
- total_debit
- total_credit

acc_journal_line:
- acc_journal_line_id
- acc_journal_entry_id
- line_no
- account_code
- subledger_type nullable
- subledger_reference_id nullable
- debit_amount
- credit_amount
- tax_code nullable
- project_id nullable
- cost_center_id nullable

## 3. Status canon
- draft
- validated
- posted
- reversed
- corrected
- closed

## 4. Invariants
- posted journal must balance debit and credit
- closed period blocks unauthorized posting
- settlement truth is append-oriented and auditable
