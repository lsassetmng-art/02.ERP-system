# ============================================================
# ERP SETTLEMENT EVIDENCE ACTUAL RESULTS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the first actual evidence-based settlement-family results.

review_basis:
- settlement-family deep review documents
- evidence capture rule documents
- current known concrete candidates from schema and dump review

# ============================================================
# 1. MAIN FINDING
# ============================================================

main_finding:
The strongest current settlement-family anchor remains:
- finance.payment_allocation

projection-side companion:
- public.v_finance_payment_allocation

# ============================================================
# 2. FIRST-PASS ROLE JUDGMENT
# ============================================================

finance.payment_allocation:
  working_role:
  - line/application truth candidate
  evidence_strength:
  - medium
  reasons:
  - strongest concrete accounting-side allocation candidate
  - meaning aligns with payment application semantics
  - better fit for settlement/application-side truth than nearby allocation-like families

public.v_finance_payment_allocation:
  working_role:
  - projection/read surface
  evidence_strength:
  - medium_to_high
  reasons:
  - explicit v_ prefix
  - public-side exposure pattern
  - consistent with projection/read-model behavior

# ============================================================
# 3. WHAT IS NOT YET PROVEN
# ============================================================

what_is_not_yet_proven:
- explicit settlement header truth
- exact insert/update path into finance.payment_allocation
- exact source/target linkage to receivable or payable base truth
- whether settlement truth is fully represented by allocation rows alone

# ============================================================
# 4. CURRENT FAMILY BOUNDARY
# ============================================================

current_family_boundary:
Keep settlement-family narrow around:
- payment/receipt application
- accounting-side allocation/clearing meaning

Do not widen by default to:
- purchase three-way match
- manufacturing allocation families

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Settlement-family is now weak-to-medium hardened around
finance.payment_allocation as the strongest application-side truth candidate,
with explicit header-side truth still unresolved.
