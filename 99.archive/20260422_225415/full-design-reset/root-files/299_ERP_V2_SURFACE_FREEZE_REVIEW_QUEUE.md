# ============================================================
# ERP V2 SURFACE FREEZE REVIEW QUEUE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Lists the surface-side objects
that may be frozen later as projection/writable-surface layers.

surface_review_queue:
- public.v_finance_payment_allocation
- public.v_sales_billing_detail
- public.v_purchase_purchase_three_way_match
- public.approval_request_with_url

review_rule:
These objects should be reviewed only after
their stronger underlying base/truth candidates are sufficiently fixed.

conclusion:
Surface freeze review is a secondary layer after truth/base review.
