# ============================================================
# ERP CONTRACT ALIGNMENT ACCOUNTING REVISED
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides revised contract-to-real-table alignment
for accounting-related contracts after actual column findings.

# ============================================================
# 1. PERIOD CONTRACTS
# ============================================================

contracts:
- 028_ERP_EXACT_PAYLOAD_ACCOUNTING_PERIOD_CLOSE.md
- 044_ERP_EXACT_QUERY_PERIODS_LIST.md

semantic_owner:
- 100.business / 140.accounting

revised_direct_real_table:
- public.accounting_period

support_or_specialized_real_table:
- accounting.invoice_period

alignment_notes:
- public.accounting_period is the strongest current general period truth anchor
- accounting.invoice_period is treated as specialized support, not general period truth

# ============================================================
# 2. JOURNAL CONTRACTS
# ============================================================

contracts:
- 035_ERP_EXACT_QUERY_JOURNAL_DETAIL.md
- 043_ERP_EXACT_QUERY_JOURNALS_LIST.md

semantic_owner:
- 100.business / 140.accounting

revised_direct_real_tables:
- public.journal_entries
- public.journal_lines

support_or_staging_real_tables:
- accounting.journal_candidate
- accounting.journal_draft

alignment_notes:
- public journal tables are the strongest current source_of_truth anchors
- accounting journal candidate/draft tables are staging/transitional side

# ============================================================
# 3. SETTLEMENT CONTRACTS
# ============================================================

contracts:
- 027_ERP_EXACT_PAYLOAD_ACCOUNTING_SETTLEMENT_CREATE.md
- 041_ERP_EXACT_QUERY_SETTLEMENTS_LIST.md
- 042_ERP_EXACT_QUERY_SETTLEMENT_DETAIL.md

semantic_owner:
- 100.business / 140.accounting

current_best_real_table_lead:
- finance.payment_allocation

current_alignment_status:
- provisional only
- settlement header/line truth remains unresolved

alignment_notes:
- finance.payment_allocation is the strongest current candidate lead
- settlement-family still needs deeper table-level confirmation

# ============================================================
# 4. AR/AP CONTRACTS
# ============================================================

contracts:
- 034_ERP_EXACT_QUERY_AR_DETAIL.md
- payable-adjacent contracts later

semantic_owner:
- 100.business / 140.accounting

current_best_real_table_leads:
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview

current_alignment_status:
- preview/view anchored only
- base ledger truth still unresolved

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Accounting contract alignment is now materially stronger for:
- periods
- journal detail/list

and still provisional for:
- settlement
- receivable/payable truth families
