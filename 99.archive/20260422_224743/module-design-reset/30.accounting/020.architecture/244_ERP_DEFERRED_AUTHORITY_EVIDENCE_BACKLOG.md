# ============================================================
# ERP DEFERRED AUTHORITY EVIDENCE BACKLOG
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Collects the remaining evidence tasks needed
for deferred authority entries.

backlog:
- capture final insert/update path difference between exec_run_request and integration_job
- capture stronger status/decision mutation evidence for workflow.approval_request and system.approval_request
- inspect whether settlement has distinct header/base truth beyond payment_allocation
- inspect feeder definitions for public.v_finance_payment_allocation
- inspect feeder definitions for public.v_ar_accrual_preview
- inspect feeder definitions for public.v_ap_accrual_preview
- re-check any unusual writable-view or sync path that could affect deferred families

expected_result:
This backlog should produce the missing evidence needed
to promote part of the deferred set into frozen v2.

conclusion:
The deferred backlog is small and focused compared with the work already closed in v1.
