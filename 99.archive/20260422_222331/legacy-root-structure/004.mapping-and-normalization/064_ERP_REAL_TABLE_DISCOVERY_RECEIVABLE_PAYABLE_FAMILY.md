# ============================================================
# ERP REAL TABLE DISCOVERY RECEIVABLE PAYABLE FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the next discovery target and review posture
for receivable/payable-family real tables.

# ============================================================
# 1. WHY THIS FAMILY IS NEXT
# ============================================================

why_next:
AR/AP contracts are semantically clear,
but the current real-table anchor is still unresolved.

relevant_contracts:
- 034_ERP_EXACT_QUERY_AR_DETAIL.md
- payment / settlement / accounting-side contracts

# ============================================================
# 2. DISCOVERY TARGETS
# ============================================================

candidate_name_patterns:
- receivable
- payable
- ar_
- ap_
- open_amount
- balance
- due
- aging
- writeoff
- write_off

candidate_schema_focus:
- accounting
- finance
- public
- possibly billing

# ============================================================
# 3. REVIEW QUESTIONS
# ============================================================

review_questions:
- which tables hold authoritative AR/AP balance truth?
- are receivables/payables stored as separate ledgers or invoice-derived projections?
- where are open_amount / original_amount / due_date semantics stored?
- is there one ledger table or multiple split structures?
- do billing or accounting overlap here?

# ============================================================
# 4. EXPECTED OUTPUT
# ============================================================

expected_output:
- likely receivable truth table(s)
- likely payable truth table(s)
- source_of_truth vs projection split
- contract alignment update target
- duplicate or overlap warnings if billing participates

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Receivable/payable-family discovery is the next major accounting-truth anchor after settlement.
