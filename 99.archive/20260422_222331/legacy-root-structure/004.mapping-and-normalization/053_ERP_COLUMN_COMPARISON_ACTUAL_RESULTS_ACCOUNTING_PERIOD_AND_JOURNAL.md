# ============================================================
# ERP COLUMN COMPARISON ACTUAL RESULTS
# ACCOUNTING PERIOD AND JOURNAL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Captures the actual current findings for accounting_period and journal-family tables
based on uploaded schema column data.

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. ACCOUNTING PERIOD ACTUAL FINDINGS
# ============================================================

observed_tables:
- accounting.invoice_period
- public.accounting_period

accounting.invoice_period columns excerpt:
- invoice_period_id
- invoice_line_id
- period_from
- period_to
- period_type
- amount
- note
- created_at
- created_by

public.accounting_period columns excerpt:
- period_id
- company_id
- period_year
- period_month
- is_closed
- closed_at

actual_judgment:
- public.accounting_period strongly looks like general accounting period truth
- accounting.invoice_period strongly looks like invoice-scoped support/specialized structure

working canonical classes:
- public.accounting_period -> source_of_truth
- accounting.invoice_period -> support or specialized support

# ============================================================
# 2. JOURNAL FAMILY ACTUAL FINDINGS
# ============================================================

observed_tables:
- accounting.journal_candidate
- accounting.journal_draft
- accounting.paper_send_fee_journal
- public.journal_entries
- public.journal_lines

accounting.journal_candidate columns excerpt:
- journal_candidate_id
- invoice_period_id
- revenue_bucket
- debit_account
- credit_account
- amount
- note
- created_at
- created_by

accounting.journal_draft columns excerpt:
- journal_draft_id
- company_id
- source_domain
- source_event_id
- source_view
- draft_type
- amount
- currency
- occurred_at
- generated_at
- status
- note

public.journal_entries columns excerpt:
- journal_id
- company_id
- period_id
- journal_date
- description
- source_type
- source_id
- created_by
- created_at

public.journal_lines columns excerpt:
- journal_line_id
- journal_id
- line_no
- account_id
- debit_amount
- credit_amount

actual_judgment:
- public.journal_entries + public.journal_lines strongly look like authoritative journal truth
- accounting.journal_candidate strongly looks like staging/pre-posting derivation
- accounting.journal_draft strongly looks like draft/pre-authoritative structure
- accounting.paper_send_fee_journal still looks specialized and unresolved, but likely not the central journal family truth

working canonical classes:
- public.journal_entries -> source_of_truth
- public.journal_lines -> source_of_truth
- accounting.journal_candidate -> staging
- accounting.journal_draft -> staging or transitional
- accounting.paper_send_fee_journal -> specialized support or specialized source_of_truth pending deeper review

# ============================================================
# 3. MAIN REVISION
# ============================================================

main_revision:
Earlier schema-level suspicion around core must be revised:
the actual authoritative-looking accounting_period and journal tables
currently visible in the uploaded column inventory are in public schema.

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
The actual column data supports:
- public.accounting_period as likely general period truth
- public.journal_entries / public.journal_lines as likely journal truth
- accounting.invoice_period / journal_candidate / journal_draft as support/staging-side structures
