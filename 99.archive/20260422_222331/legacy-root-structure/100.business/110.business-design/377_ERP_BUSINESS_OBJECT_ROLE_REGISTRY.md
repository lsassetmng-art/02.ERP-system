# ============================================================
# ERP BUSINESS OBJECT ROLE REGISTRY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Registers the first-pass role classification
for business-related objects.

role_registry:

  header_truth:
  - sales.order_header
  - sales.shipping_header
  - sales.billing_header
  - sales.return_header
  - purchase.purchase_order_header
  - purchase.purchase_receipt
  - purchase.purchase_invoice
  - manufacturing.work_order

  detail_truth:
  - sales.order_detail
  - sales.shipping_detail
  - sales.billing_detail
  - sales.return_detail
  - purchase.purchase_order_detail
  - purchase.purchase_receipt_detail
  - purchase.purchase_invoice_detail

  state_truth:
  - inventory.stock_balance
  - inventory.stock_lot_balance

  execution_truth:
  - manufacturing.manufacturing_execution

  reconciliation:
  - purchase.purchase_three_way_match

  handoff_linked_progression:
  - sales.order_header -> sales.shipping_header
  - sales.billing_header -> sales.return_header
  - purchase.purchase_order_header -> purchase.purchase_receipt
  - purchase.purchase_invoice_detail -> purchase.purchase_three_way_match
  - manufacturing.work_order -> manufacturing.manufacturing_execution

conclusion:
This registry provides the first formal business role split
across header, detail, state, execution, reconciliation, and handoff roles.
