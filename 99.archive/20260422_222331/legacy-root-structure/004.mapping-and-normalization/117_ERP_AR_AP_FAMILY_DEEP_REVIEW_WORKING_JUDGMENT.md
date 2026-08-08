# ============================================================
# ERP AR AP FAMILY DEEP REVIEW WORKING JUDGMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Captures the current working judgment for AR/AP family deep review.

# ============================================================
# 1. CURRENT STRONGEST VISIBLE ANCHORS
# ============================================================

current_strongest_visible_anchors:
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview

# ============================================================
# 2. CURRENT FAMILY SPLIT
# ============================================================

current_family_split:
- visible preview/read layer:
  - public.v_ar_accrual_preview
  - public.v_ap_accrual_preview
- unresolved base ledger truth:
  - not yet directly confirmed by name
- possible neighboring families:
  - billing
  - finance.payment_allocation
  - journal truth
  - period/accrual support

# ============================================================
# 3. MAIN LIMITATION
# ============================================================

main_limitation:
A clearly named receivable/payable base ledger table
has not yet been firmly isolated from current visible names.

meaning:
Current evidence is stronger for:
- read/projection anchor
than for
- explicit base-truth ledger anchor

# ============================================================
# 4. CURRENT CANONICAL CONSEQUENCE
# ============================================================

current_canonical_consequence:
AR/AP contracts can now be provisionally aligned toward:
- preview/read surface on the query side

But they should still remain marked:
- provisional
- unresolved on base-table/source-of-truth side

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
AR/AP family review now has a workable projection-side anchor,
but still lacks a hard base-ledger anchor.
