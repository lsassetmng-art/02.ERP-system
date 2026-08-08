# ============================================================
# ERP BUSINESS AUTHORITY MATRIX
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass authority matrix
for business-related objects.

authority_matrix:

  sales.order_header:
    authority_role:
    - sales order truth anchor
    authority_strength:
    - strong
    notes:
    - main order-side business document anchor

  sales.billing_header:
    authority_role:
    - sales billing truth anchor
    authority_strength:
    - strong
    notes:
    - main billing-side business document anchor

  sales.shipping_header:
    authority_role:
    - sales shipping truth anchor
    authority_strength:
    - medium
    notes:
    - shipment-side business progression anchor

  sales.return_header:
    authority_role:
    - sales return truth anchor
    authority_strength:
    - medium
    notes:
    - return-side business progression anchor

  purchase.purchase_order_header:
    authority_role:
    - purchase order truth anchor
    authority_strength:
    - strong
    notes:
    - main PO-side business document anchor

  purchase.purchase_receipt:
    authority_role:
    - purchase receipt truth anchor
    authority_strength:
    - medium
    notes:
    - receipt-side business progression anchor

  purchase.purchase_invoice:
    authority_role:
    - purchase invoice truth anchor
    authority_strength:
    - strong
    notes:
    - invoice-side business document anchor

  purchase.purchase_three_way_match:
    authority_role:
    - reconciliation authority
    authority_strength:
    - medium
    notes:
    - matching and reconciliation layer, not primary upstream anchor

  inventory.stock_balance:
    authority_role:
    - aggregate inventory state anchor
    authority_strength:
    - strong
    notes:
    - aggregate stock-state truth anchor

  inventory.stock_lot_balance:
    authority_role:
    - lot-level inventory state anchor
    authority_strength:
    - medium
    notes:
    - more granular inventory state layer

  manufacturing.work_order:
    authority_role:
    - manufacturing work-order truth anchor
    authority_strength:
    - strong
    notes:
    - plan/order-side manufacturing anchor

  manufacturing.manufacturing_execution:
    authority_role:
    - manufacturing execution truth anchor
    authority_strength:
    - medium
    notes:
    - downstream execution-side anchor

conclusion:
Business authority is distributed across domain anchors,
progression anchors, reconciliation layers, and state layers.
