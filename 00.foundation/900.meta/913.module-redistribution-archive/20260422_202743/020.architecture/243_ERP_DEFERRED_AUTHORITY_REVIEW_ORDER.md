# ============================================================
# ERP DEFERRED AUTHORITY REVIEW ORDER
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the recommended review order
for deferred authority entries after frozen v1.

review_order:
1. system.exec_run_request vs integration.integration_job
2. workflow.approval_request vs system.approval_request
3. finance.payment_allocation and settlement-side truth
4. public.v_ar_accrual_preview feeder/base truth
5. public.v_ap_accrual_preview feeder/base truth
6. lower-priority deferred support/history families

why_this_order:
- runtime and approval truth competitions are narrow and high-impact
- settlement and AR/AP need deeper feeder/base-truth discovery
- lower-priority deferred support families can wait

conclusion:
This order minimizes ambiguity fastest for frozen v2 preparation.
