# ============================================================
# ERP FROZEN V1 DEFERRED NEXT CYCLE NOTE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Explains how deferred entries from frozen authority registry v1
should be handled in the next cycle.

deferred_scope_from_v1:
- system.exec_run_request
- integration.integration_job
- finance.payment_allocation
- public.v_finance_payment_allocation
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview
- workflow.approval_request
- system.approval_request
- lower-priority deferred support families

main_rule:
Deferred entries are not rejected.
They move into the next authority-promotion cycle
with tighter verification focus.

conclusion:
Frozen v1 closes the stable core,
while deferred entries define the v2 work frontier.
