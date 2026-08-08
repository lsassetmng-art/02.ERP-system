# ============================================================
# ERP V2 SETTLEMENT FREEZE DECISION
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the current freeze decision
for settlement-side v2 candidates.

main_base_target:
- finance.payment_allocation

surface_target:
- public.v_finance_payment_allocation

current_reading:
- finance.payment_allocation is the strongest current settlement line/application truth candidate
- public.v_finance_payment_allocation is a writable surface over the base table
- remaining open question exists about broader settlement header/base scope

decision:
- finance.payment_allocation -> freeze_now
- public.v_finance_payment_allocation -> freeze_in_layered_form

important_caution:
This does not prove that all settlement truth collapses into payment_allocation.
It only means the payment_allocation family is strong enough
for layered freeze treatment now.

conclusion:
Settlement v2 is strong enough
to freeze finance.payment_allocation and its writable surface in layered form.
