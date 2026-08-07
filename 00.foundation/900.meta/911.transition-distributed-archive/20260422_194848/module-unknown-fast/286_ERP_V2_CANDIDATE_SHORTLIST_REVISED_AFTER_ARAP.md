# ============================================================
# ERP V2 CANDIDATE SHORTLIST REVISED AFTER AR/AP
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Revises the v2 candidate shortlist
after AR/AP role-comparison results.

revised_candidate_shortlist:

  runtime_side:
  - system.exec_run_request

  settlement_side:
  - finance.payment_allocation
  - public.v_finance_payment_allocation

  approval_side:
  - audit.approval_request

  ar_side:
  - sales.billing_header
  - sales.billing_detail

  ap_side:
  - purchase.purchase_invoice
  - purchase.purchase_invoice_detail
  - purchase.purchase_three_way_match

why_added:
- object existence is confirmed
- role hierarchy is now materially clearer
- truth vs detail vs reconciliation scope can now be judged directly

projection_surfaces_not_listed_as_main_truth_candidates:
- public.v_sales_billing_detail
- public.v_purchase_purchase_three_way_match

conclusion:
The v2 shortlist is now broader and more concrete,
with AR/AP moved from rediscovery into promotion review.
