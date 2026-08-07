# ============================================================
# ERP SETTLEMENT AND AR AP FINAL VERIFICATION PLAN
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the final verification plan
for settlement and AR/AP unresolved authority gaps.

verification_targets:
- finance.payment_allocation
- public.v_finance_payment_allocation
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview
- any underlying feeder/base-ledger candidates discovered next

main_questions:
- does settlement have distinct header/base truth beyond allocation?
- what are the feeder tables behind AR/AP preview views?
- is AR/AP truth ledger-native, journal-derived, or allocation-derived?
- which entries can be frozen as projection-only even if base truth remains open?

possible outcomes:
- payment_allocation remains hardened only
- payment_allocation promoted to frozen_candidate for line/application truth
- AR/AP preview views frozen as projection-only while base truth remains held
- AR/AP base ledger candidates discovered and promoted later

conclusion:
Settlement and AR/AP freeze readiness depends on closing
base-truth and feeder-path ambiguity.
