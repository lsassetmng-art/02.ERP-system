# ============================================================
# ERP FROZEN AUTHORITY REGISTRY V2 ACTUAL SETTLEMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records actual newly frozen settlement entries in v2.

actual_frozen_entries:

  finance.payment_allocation:
    semantic_owner:
    - settlement line/application truth
    registry_class:
    - source_of_truth
    freeze_status:
    - frozen
    freeze_cycle:
    - v2
    rationale:
    - strongest current settlement line/application truth candidate
    - confirmed as real base table
    - stronger than earlier provisional assumptions

layered_frozen_surface:

  public.v_finance_payment_allocation:
    semantic_owner:
    - settlement writable projection surface
    registry_class:
    - projection_or_writable_surface
    freeze_status:
    - frozen_in_layered_form
    freeze_cycle:
    - v2
    rationale:
    - reads from finance.payment_allocation
    - INSTEAD OF trigger exists
    - best treated as writable surface over the frozen base table

scope_open_but_not_blocking_current_freeze:
- possible broader settlement extra header/base truth

conclusion:
Settlement v2 adds finance.payment_allocation
and freezes its writable surface in layered form.
