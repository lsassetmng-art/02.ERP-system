# ============================================================
# ERP HEADER PAIR PROVISIONAL AUTHORITY DECISION
# BILLING RETURN SHIPPING
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the provisional authority decisions for:
- public.billing_header vs sales.billing_header
- public.return_header vs sales.return_header
- public.shipping_header vs sales.shipping_header

review_basis:
- actual pairwise structural overlap
- current header authority policy
- domain-side extension signals where present

# ============================================================
# 1. BILLING HEADER PAIR
# ============================================================

pair_target:
- public.billing_header
- sales.billing_header

observed_fact:
The structures are highly similar,
but sales.billing_header contains:
- original_billing_id

provisional_decision:
- canonical semantic owner:
  - business billing/accounting-adjacent truth
- provisional write authority:
  - sales.billing_header
- provisional mirror_or_transitional:
  - public.billing_header
- provisional label for public side:
  - mirror_or_transitional_candidate

rationale:
The additional domain-side column suggests stronger operational specificity
on the sales side.

# ============================================================
# 2. RETURN HEADER PAIR
# ============================================================

pair_target:
- public.return_header
- sales.return_header

observed_fact:
The structures are highly similar,
but sales.return_header contains:
- shipping_id

provisional_decision:
- canonical semantic owner:
  - sales / fulfillment-side business truth
- provisional write authority:
  - sales.return_header
- provisional mirror_or_transitional:
  - public.return_header
- provisional label for public side:
  - mirror_or_transitional_candidate

rationale:
The additional shipping linkage suggests stronger operational specificity
on the sales side.

# ============================================================
# 3. SHIPPING HEADER PAIR
# ============================================================

pair_target:
- public.shipping_header
- sales.shipping_header

observed_fact:
The structures currently appear effectively identical.

provisional_decision:
- canonical semantic owner:
  - shipping / fulfillment-side business truth
- provisional write authority:
  - sales.shipping_header
- provisional mirror_or_transitional:
  - public.shipping_header
- provisional label for public side:
  - mirror_or_transitional_pending_runtime_confirmation

rationale:
In identical-pair cases, prefer domain-side write authority
to avoid dual-authority ambiguity.

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
Provisional policy results:
- sales.billing_header = write-authority candidate
- sales.return_header = write-authority candidate
- sales.shipping_header = write-authority candidate

and their public counterparts are provisionally:
- mirror candidates
or
- transitional duplicates
