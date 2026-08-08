# ============================================================
# ERP CONTRACT ALIGNMENT QUERY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides first-pass exact-contract-to-real-table alignment
for major read/query contracts outside pure accounting and approval action flows.

# ============================================================
# 1. EXECUTION DETAIL QUERY
# ============================================================

contract:
- 033_ERP_EXACT_QUERY_EXECUTION_DETAIL.md

semantic_owner:
- platform runtime-related ownership

likely_direct_real_tables:
- unresolved workflow/ops/runtime table families

likely_indirect_or_support_real_tables:
- notify support tables
- workflow support tables
- event/execution audit tables

alignment_notes:
- strong semantic contract exists
- real table anchor still needs discovery among ops/workflow/system-like schemas

# ============================================================
# 2. DOCUMENTS LIST / DETAIL / HISTORY
# ============================================================

contracts:
- 038_ERP_EXACT_QUERY_DOCUMENTS_LIST.md
- 039_ERP_EXACT_QUERY_DOCUMENT_DETAIL.md
- 040_ERP_EXACT_QUERY_DOCUMENT_HISTORY.md

semantic_owner:
- mixed business/control read surface

likely_direct_real_tables:
- unresolved document-family real tables
- unresolved source document tables by domain

likely_indirect_or_support_real_tables:
- approval truth tables
- audit/history/event tables
- workflow/history support tables

alignment_notes:
- contracts are canonical and stable
- real document-family table inventory still needs explicit extraction

# ============================================================
# 3. DASHBOARD CONTROL TOWER QUERY
# ============================================================

contract:
- 036_ERP_EXACT_QUERY_DASHBOARD_CONTROL_TOWER.md

semantic_owner:
- 300.analytics / 330.dashboard

likely_direct_real_tables:
- unresolved analytics/dashboard real tables

likely_indirect_or_support_real_tables:
- source business/control tables
- cache/projection/derived tables

alignment_notes:
- dashboard contract should eventually align to derived/cache/projection tables, not source-of-truth transactional tables directly

# ============================================================
# 4. SETTLEMENT LIST / DETAIL QUERY
# ============================================================

contracts:
- 041_ERP_EXACT_QUERY_SETTLEMENTS_LIST.md
- 042_ERP_EXACT_QUERY_SETTLEMENT_DETAIL.md

semantic_owner:
- 100.business / 140.accounting

likely_direct_real_tables:
- unresolved settlement-family real tables

likely_indirect_or_support_real_tables:
- public.journal_entries
- public.journal_lines

alignment_notes:
- settlement-family real tables remain to be explicitly located

# ============================================================
# 5. CURRENT PRIORITY
# ============================================================

current_priority:
Next real-table discovery should target:
- settlement-family tables
- receivable/payable-family tables
- approval true subfamily tables
- execution/runtime-family tables
- document-family tables

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
Query contract alignment is partially anchored
and partially awaiting further real-table family discovery.
