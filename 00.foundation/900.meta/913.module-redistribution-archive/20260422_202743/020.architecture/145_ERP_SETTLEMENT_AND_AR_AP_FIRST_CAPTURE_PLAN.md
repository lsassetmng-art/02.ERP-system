# ============================================================
# ERP SETTLEMENT AND AR AP FIRST CAPTURE PLAN
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first practical capture plan
for settlement and AR/AP evidence hardening.

capture_order:
1. finance.payment_allocation
2. public.v_finance_payment_allocation
3. public.v_ar_accrual_preview
4. public.v_ap_accrual_preview
5. billing linkage evidence
6. journal linkage evidence
7. payment linkage evidence

expected_best_outcome:
- payment_allocation role hardened as line/application truth or revised
- view-vs-base distinction confirmed for settlement side
- AR/AP preview feeder tables identified
- billing boundary and journal boundary clarified
- stronger contract-to-real-table revision basis obtained

stop_conditions_for_first_pass:
- allocation write target or derivation path identified
- AR/AP preview feeder identified
- at least one stronger base-truth hypothesis established
- projection vs source_of_truth distinction improved

next_after_this_plan:
- approval_request subfamily evidence hardening
- runtime/header authority confirmation hardening
- revised settlement and AR/AP contract alignment pass

conclusion:
This plan turns settlement and AR/AP review
from anchored suspicion into evidence collection.
