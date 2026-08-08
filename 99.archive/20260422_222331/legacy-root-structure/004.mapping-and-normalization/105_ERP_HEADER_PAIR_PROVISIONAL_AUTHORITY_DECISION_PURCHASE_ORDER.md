# ============================================================
# ERP HEADER PAIR PROVISIONAL AUTHORITY DECISION PURCHASE ORDER
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the provisional authority decision for:
- public.purchase_order_header
- purchase.purchase_order_header

review_basis:
- actual pairwise structural overlap
- current header authority policy

# ============================================================
# 1. REVIEW TARGET
# ============================================================

pair_target:
- public.purchase_order_header
- purchase.purchase_order_header

# ============================================================
# 2. OBSERVED FACT
# ============================================================

observed_fact:
The two tables currently appear structurally identical
in the uploaded column inventory.

# ============================================================
# 3. PROVISIONAL DECISION
# ============================================================

provisional_decision:
- canonical semantic owner:
  - 100.business / 120.purchase
- provisional write authority:
  - purchase.purchase_order_header
- provisional mirror_or_transitional:
  - public.purchase_order_header
- provisional label for public side:
  - mirror_or_transitional_pending_runtime_confirmation

# ============================================================
# 4. RATIONALE
# ============================================================

rationale:
When structure is identical,
prefer domain-side write authority over unresolved dual-authority.

purchase.purchase_order_header is currently the stronger domain-local candidate
for operational ownership.

public.purchase_order_header is therefore provisionally treated as:
- mirror
or
- transitional duplicate
pending runtime/write-path confirmation.

# ============================================================
# 5. OPEN QUESTION
# ============================================================

open_question:
Is public.purchase_order_header:
- a read-model mirror
- a sync target
- a legacy duplicate still receiving writes
- or the actual active write target in practice

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
Provisional policy result:
- purchase.purchase_order_header = write-authority candidate
- public.purchase_order_header = mirror/transitional candidate
