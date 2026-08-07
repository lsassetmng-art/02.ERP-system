# ============================================================
# ERP V2 AR AP SCOPE DECISION QUEUE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the remaining AR/AP scope decisions
needed before frozen-v2 admission.

decision_queue:

  ar_side:
  - is sales.billing_header the dominant AR truth anchor?
  - is sales.billing_detail subordinate detail truth only?
  - should both be frozen in layered form?

  ap_side:
  - is purchase.purchase_invoice the dominant AP truth anchor?
  - is purchase.purchase_invoice_detail subordinate detail truth only?
  - is purchase.purchase_three_way_match reconciliation/support only,
    or strong enough for layered frozen treatment?

  surface_side:
  - should public.v_sales_billing_detail be frozen as projection-only?
  - should public.v_purchase_purchase_three_way_match be frozen as projection-only?

conclusion:
AR/AP v2 is now blocked mainly by scope decisions,
not by object discovery.
