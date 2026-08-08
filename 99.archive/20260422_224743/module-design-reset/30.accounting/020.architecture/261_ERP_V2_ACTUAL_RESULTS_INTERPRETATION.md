# ============================================================
# ERP V2 ACTUAL RESULTS INTERPRETATION
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Interprets the actual v2 findings across runtime,
settlement, approval, and AR/AP.

main_interpretation:
- runtime now materially favors system.exec_run_request
- settlement now materially favors finance.payment_allocation plus public.v_finance_payment_allocation writable-view structure
- approval now materially favors audit.approval_request
- AR/AP remains open due to exact-name instability

biggest_corrections_to_earlier_bias:
- workflow.approval_request is no longer the strongest approval truth candidate
- audit.approval_request is now the strongest approval truth candidate
- public.v_finance_payment_allocation is stronger than a simple passive projection assumption

what_remains_open:
- final runtime freezing decision
- final settlement sufficiency decision
- AR/AP rediscovery
- final approval freezing decision between audit and system roles

conclusion:
V2 actual results materially harden runtime, settlement, and approval,
while AR/AP moves into semantic rediscovery mode.
