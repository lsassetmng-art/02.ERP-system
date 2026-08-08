# ============================================================
# ERP SETTLEMENT FAMILY DEEP REVIEW WORKING JUDGMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Captures the current working judgment for settlement-family deep review.

# ============================================================
# 1. STRONGEST CURRENT CANDIDATE
# ============================================================

strongest_current_candidate:
- finance.payment_allocation

public_or_projection_side:
- public.v_finance_payment_allocation

# ============================================================
# 2. CURRENT FAMILY SPLIT
# ============================================================

current_family_split:
- settlement/application-side candidate:
  - finance.payment_allocation
- likely projection/read side:
  - public.v_finance_payment_allocation
- nearby but distinct support families:
  - purchase.purchase_three_way_match
  - manufacturing.mrp_allocation

# ============================================================
# 3. CURRENT LIMITATION
# ============================================================

current_limitation:
A clearly named settlement header table is still not confirmed.

meaning:
Current evidence is stronger for:
- line/application truth
than for
- explicit settlement header truth

# ============================================================
# 4. CURRENT CANONICAL CONSEQUENCE
# ============================================================

current_canonical_consequence:
Settlement contracts can now be provisionally aligned toward:
- finance.payment_allocation as application-side truth candidate

But they should still remain marked:
- provisional
- incomplete on header-side discovery

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Settlement-family review now has a workable anchor,
but still lacks full header/line completeness.
