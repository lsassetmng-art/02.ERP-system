# ============================================================
# ERP V2 SETTLEMENT ARAP REDISCOVERY PLAN
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the rediscovery plan
if settlement / ARAP candidate names are not found directly.

current_assumed_targets:
- finance.payment_allocation
- public.v_finance_payment_allocation
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview

rediscovery_rule:
If these names are absent,
search should shift from exact names to:
- payment application families
- allocation / clearing / settlement semantics
- receivable / payable preview semantics
- accrual / open amount / aging semantics
- billing-to-payment linkage semantics

possible outcomes:
- original names confirmed
- renamed or aliased objects found
- projection surfaces confirmed under different names
- base truth still unresolved but search space narrowed

conclusion:
Settlement and AR/AP v2 should continue by semantic rediscovery
rather than exact-name dependence alone.
