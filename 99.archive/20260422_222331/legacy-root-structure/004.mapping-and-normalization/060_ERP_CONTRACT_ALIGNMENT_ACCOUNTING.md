# ============================================================
# ERP CONTRACT ALIGNMENT ACCOUNTING
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides first-pass exact-contract-to-real-table alignment
for accounting-related contracts.

# ============================================================
# 1. ACCOUNTING PERIOD CLOSE
# ============================================================

contract:
- 028_ERP_EXACT_PAYLOAD_ACCOUNTING_PERIOD_CLOSE.md

semantic_owner:
- 100.business / 140.accounting

likely_direct_real_tables:
- public.accounting_period

likely_indirect_or_support_real_tables:
- accounting.invoice_period
- public.journal_entries
- public.journal_lines

alignment_notes:
- close action most likely mutates public.accounting_period
- accounting.invoice_period may participate as invoice-scope support, not general period truth
- journal tables may be checked for blockers but are not necessarily directly mutated by close itself

# ============================================================
# 2. ACCOUNTING PERIOD REOPEN REQUEST
# ============================================================

contract:
- 029_ERP_EXACT_PAYLOAD_ACCOUNTING_PERIOD_REOPEN_REQUEST.md

semantic_owner:
- 200.management / governance-related control
with downstream accounting effect later

likely_direct_real_tables:
- unresolved approval/governance request subfamily tables

likely_indirect_or_support_real_tables:
- public.accounting_period

alignment_notes:
- reopen-request should not directly mutate public.accounting_period in request scope
- actual real request table remains unresolved because approval/governance request family is mixed across schemas

# ============================================================
# 3. ACCOUNTING SETTLEMENT CREATE
# ============================================================

contract:
- 027_ERP_EXACT_PAYLOAD_ACCOUNTING_SETTLEMENT_CREATE.md

semantic_owner:
- 100.business / 140.accounting

likely_direct_real_tables:
- unresolved settlement-family real tables

likely_indirect_or_support_real_tables:
- public.journal_entries
- public.journal_lines

alignment_notes:
- settlement direct real table still needs explicit discovery
- journal entries/lines may be downstream accounting effects, not necessarily first direct write target

# ============================================================
# 4. AR DETAIL QUERY
# ============================================================

contract:
- 034_ERP_EXACT_QUERY_AR_DETAIL.md

semantic_owner:
- 100.business / 140.accounting

likely_direct_real_tables:
- unresolved accounts_receivable-family real tables

likely_indirect_or_support_real_tables:
- public.journal_entries
- public.journal_lines

alignment_notes:
- receivable detail contract is semantically clear
- real table alignment for receivable-family still requires table-name discovery beyond current anchor set

# ============================================================
# 5. JOURNAL DETAIL / LIST
# ============================================================

contracts:
- 035_ERP_EXACT_QUERY_JOURNAL_DETAIL.md
- 043_ERP_EXACT_QUERY_JOURNALS_LIST.md

semantic_owner:
- 100.business / 140.accounting

likely_direct_real_tables:
- public.journal_entries
- public.journal_lines

likely_indirect_or_support_real_tables:
- core or accounting support/link tables if present in broader inventory
- journal source linkage tables

alignment_notes:
- this is currently one of the strongest contract-to-real-table alignments
- public.journal_entries / public.journal_lines are the best current first-pass targets

# ============================================================
# 6. PERIODS LIST QUERY
# ============================================================

contract:
- 044_ERP_EXACT_QUERY_PERIODS_LIST.md

semantic_owner:
- 100.business / 140.accounting

likely_direct_real_tables:
- public.accounting_period

likely_indirect_or_support_real_tables:
- accounting.invoice_period

alignment_notes:
- public.accounting_period is the strongest current match
- invoice_period likely remains support/specialized and not the primary list truth

# ============================================================
# 7. CONCLUSION
# ============================================================

conclusion:
Accounting contract alignment is currently strongest for:
- periods list -> public.accounting_period
- journal detail/list -> public.journal_entries + public.journal_lines

Settlement and receivable contracts still need further real-table discovery.
