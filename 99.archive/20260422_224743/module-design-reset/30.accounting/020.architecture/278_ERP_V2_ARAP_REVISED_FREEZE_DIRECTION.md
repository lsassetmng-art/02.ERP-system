# ============================================================
# ERP V2 AR/AP REVISED FREEZE DIRECTION
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Revises the freeze direction for AR/AP
after candidate hierarchy inspection.

revised_direction:
- AR side should be evaluated through:
  - sales.billing_header
  - sales.billing_detail
  - public.v_sales_billing_detail

- AP side should be evaluated through:
  - purchase.purchase_invoice
  - purchase.purchase_invoice_detail
  - purchase.purchase_three_way_match
  - public.v_purchase_purchase_three_way_match

what_is_no_longer_primary:
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview

why:
These exact names were not confirmed,
while the billing / purchase-invoice / three-way-match families
were directly confirmed through view definitions and FK structure.

conclusion:
AR/AP freeze work should now continue on billing-side and purchase-side candidate families.
