# ============================================================
# ERP AR AP FAMILY DEEP REVIEW BILLING BOUNDARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Clarifies the current billing boundary during AR/AP family review.

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Billing-related tables should not automatically be treated
as AR/AP source_of_truth tables.

# ============================================================
# 2. WHY THIS MATTERS
# ============================================================

why_this_matters:
AR/AP truth may be:
- ledger-side truth
- accrual-side truth
- invoice-derived but still separately represented
- payment allocation linked

Billing headers alone do not prove:
- receivable ledger truth
- payable ledger truth
- balance truth
- aging truth

# ============================================================
# 3. CURRENT WORKING BOUNDARY
# ============================================================

current_working_boundary:
- billing_header family:
  business document/invoice-facing header truth candidate
- AR/AP family:
  accounting-side balance/accrual/ledger truth candidate
- payment_allocation family:
  settlement/application-side candidate

# ============================================================
# 4. REVIEW CONSEQUENCE
# ============================================================

review_consequence:
When AR/AP real tables are finally identified,
they should be checked against billing only as:
- source linkage
- derivation boundary
- invoice relation boundary

not assumed to be the same truth automatically.

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Billing and AR/AP remain related but distinct review families.
Billing truth must not be collapsed into AR/AP ledger truth without evidence.
