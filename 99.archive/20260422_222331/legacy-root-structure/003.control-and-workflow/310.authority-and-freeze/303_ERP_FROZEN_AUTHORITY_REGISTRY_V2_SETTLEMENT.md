# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V2 SETTLEMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the current frozen-v2 draft position
for settlement-family candidates.

draft_entries:

  finance.payment_allocation:
    semantic_owner:
    - settlement line/application truth candidate
    registry_class:
    - source_of_truth_candidate
    draft_freeze_status:
    - promoted_for_v2_review
    rationale:
    - base table existence confirmed
    - stronger than earlier provisional assumptions
    - underlying base object behind public writable surface

surface_side_entry:

  public.v_finance_payment_allocation:
    semantic_owner:
    - settlement writable projection surface
    registry_class:
    - projection_or_writable_surface
    draft_freeze_status:
    - surface_review_only
    rationale:
    - reads from finance.payment_allocation
    - INSTEAD OF trigger exists
    - better treated as writable surface than main truth

remaining_open_scope:
- whether settlement needs additional header/base truth beyond payment_allocation

conclusion:
Settlement v2 is led by finance.payment_allocation,
while the public view remains a layered surface candidate.
