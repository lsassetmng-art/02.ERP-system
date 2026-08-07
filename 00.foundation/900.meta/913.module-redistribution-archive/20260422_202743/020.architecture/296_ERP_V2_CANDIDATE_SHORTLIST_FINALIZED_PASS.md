# ============================================================
# ERP V2 CANDIDATE SHORTLIST FINALIZED PASS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the revised v2 shortlist
after approval role-comparison results.

finalized_shortlist_pass:

  runtime_side:
  - system.exec_run_request

  settlement_side:
  - finance.payment_allocation

  approval_side:
  - audit.approval_request

  ar_side:
  - sales.billing_header
  - sales.billing_detail

  ap_side:
  - purchase.purchase_invoice
  - purchase.purchase_invoice_detail
  - purchase.purchase_three_way_match

surface_side_review_only:
- public.v_finance_payment_allocation
- public.v_sales_billing_detail
- public.v_purchase_purchase_three_way_match
- public.approval_request_with_url

conclusion:
The v2 shortlist is now centered on the strongest base/truth candidates,
while surface-side objects are separated for layered review.
