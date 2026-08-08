# ============================================================
# ERP UNRESOLVED REAL TABLE DISCOVERY SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the remaining unresolved real-table discovery priorities
after the revised first-pass alignment.

# ============================================================
# 1. PRIORITY ORDER
# ============================================================

priority_order:
1. settlement-family
2. receivable/payable-family
3. execution/runtime-family
4. document-family

# ============================================================
# 2. WHY THIS ORDER
# ============================================================

why_this_order:
- settlement and AR/AP are blocking stronger accounting contract alignment
- execution/runtime is blocking stronger platform contract alignment
- document-family is blocking generic document contract physical grounding

# ============================================================
# 3. CURRENTLY RESOLVED ENOUGH TO ANCHOR
# ============================================================

resolved_enough_to_anchor:
- public.accounting_period
- public.journal_entries
- public.journal_lines
- accounting.invoice_period as support-side candidate
- accounting.journal_candidate as staging candidate
- accounting.journal_draft as staging/transitional candidate
- system_control as duplicated support family

# ============================================================
# 4. STILL NOT RESOLVED
# ============================================================

still_not_resolved:
- settlement header/line truth
- AR/AP authoritative ledger tables
- execution current-state tables
- document shared-vs-domain-specific storage model
- approval_request true subfamily target tables

# ============================================================
# 5. NEXT STEP
# ============================================================

next_step:
Use real table inventory to extract candidate table names
for these unresolved families and then classify them table-by-table.

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
The revised mapping has established anchors.
The next real progress comes from resolving the remaining four table families.
