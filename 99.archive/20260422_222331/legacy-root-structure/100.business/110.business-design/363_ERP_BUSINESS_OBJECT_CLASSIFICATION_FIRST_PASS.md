# ============================================================
# ERP BUSINESS OBJECT CLASSIFICATION FIRST PASS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass classification
for business-related objects after inventory review.

classification:

  sales_document_chain:
  - sales.order_header
  - sales.order_detail
  - sales.shipping_header
  - sales.shipping_detail
  - sales.billing_header
  - sales.billing_detail
  - sales.return_header
  - sales.return_detail

  purchase_document_chain:
  - purchase.purchase_order_header
  - purchase.purchase_order_detail
  - purchase.purchase_receipt
  - purchase.purchase_receipt_detail
  - purchase.purchase_invoice
  - purchase.purchase_invoice_detail
  - purchase.purchase_three_way_match

  inventory_business_state:
  - inventory.stock_balance
  - inventory.stock_lot_balance

  manufacturing_business_state:
  - manufacturing.work_order
  - manufacturing.manufacturing_execution

  business_handoff_links:
  - sales order to shipping
  - sales billing to return
  - purchase order to receipt
  - purchase receipt to invoice
  - purchase invoice detail to three-way-match
  - manufacturing work_order to execution

conclusion:
Business is best understood as a multi-domain architecture
with document chains, state layers, and handoff links.
