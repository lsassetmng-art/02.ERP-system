# ============================================================
# ERP BUSINESS RESPONSIBILITY MATRIX
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass responsibility matrix
for business-related objects.

responsibility_matrix:

  sales.order_header:
    responsibility:
    - sales order lifecycle
    - order-side document truth

  sales.order_detail:
    responsibility:
    - order line detail truth

  sales.shipping_header:
    responsibility:
    - shipment lifecycle
    - shipping-side handoff truth

  sales.shipping_detail:
    responsibility:
    - shipment line detail truth

  sales.billing_header:
    responsibility:
    - billing lifecycle
    - billing-side business truth

  sales.billing_detail:
    responsibility:
    - billing line detail truth

  sales.return_header:
    responsibility:
    - return lifecycle
    - return-side business truth

  sales.return_detail:
    responsibility:
    - return line detail truth

  purchase.purchase_order_header:
    responsibility:
    - purchase order lifecycle
    - PO-side document truth

  purchase.purchase_order_detail:
    responsibility:
    - PO line detail truth

  purchase.purchase_receipt:
    responsibility:
    - receipt lifecycle
    - receipt-side business truth

  purchase.purchase_receipt_detail:
    responsibility:
    - receipt line detail truth

  purchase.purchase_invoice:
    responsibility:
    - purchase invoice lifecycle
    - invoice-side business truth

  purchase.purchase_invoice_detail:
    responsibility:
    - purchase invoice line detail truth

  purchase.purchase_three_way_match:
    responsibility:
    - PO / receipt / invoice reconciliation

  inventory.stock_balance:
    responsibility:
    - aggregate stock-state truth

  inventory.stock_lot_balance:
    responsibility:
    - lot-level stock-state truth

  manufacturing.work_order:
    responsibility:
    - manufacturing order lifecycle

  manufacturing.manufacturing_execution:
    responsibility:
    - manufacturing execution lifecycle

conclusion:
Business responsibilities are layered across
header truth, detail truth, state truth, execution truth, and reconciliation.
