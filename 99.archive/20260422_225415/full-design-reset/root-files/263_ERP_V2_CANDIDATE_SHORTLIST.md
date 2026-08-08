# ============================================================
# ERP V2 CANDIDATE SHORTLIST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Lists the strongest current frozen-v2 candidates
after the latest actual-result pass.

candidate_shortlist:

  runtime_side:
  - system.exec_run_request

  settlement_side:
  - finance.payment_allocation
  - public.v_finance_payment_allocation

  approval_side:
  - audit.approval_request

why_these_are_now_shortlisted:
- real object existence is confirmed
- evidence strength materially improved
- prior competition narrowed
- these objects now have clearer promotion direction than before

not_included_yet:
- integration.integration_job
- system.approval_request
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview

conclusion:
The v2 shortlist is now centered on runtime, settlement, and approval anchors,
while AR/AP remains outside the shortlist pending rediscovery.
