# ============================================================
# ERP V2 AR/AP PROMOTION DIRECTION REVISED
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Revises the promotion direction for AR/AP
after role-comparison results.

revised_ar_direction:
- header anchor:
  - sales.billing_header
- detail/base candidate:
  - sales.billing_detail
- projection/writable surface:
  - public.v_sales_billing_detail

revised_ap_direction:
- invoice anchor:
  - purchase.purchase_invoice
- detail/base candidate:
  - purchase.purchase_invoice_detail
- reconciliation candidate:
  - purchase.purchase_three_way_match
- projection/writable surface:
  - public.v_purchase_purchase_three_way_match

main_change:
AR/AP is now close to promotion review on both sides,
with much less dependence on earlier preview-name assumptions.

conclusion:
AR/AP should now be evaluated through billing-side and purchase-invoice-side layered families.
