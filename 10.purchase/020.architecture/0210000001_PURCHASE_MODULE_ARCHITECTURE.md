# ============================================================
# PURCHASE MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 10.purchase

## 1. Logical components
1. Purchase Order Aggregate Service
2. Supplier Acknowledgement Service
3. Receipt Expectation Bridge Service
4. PO Change / Cancellation Service
5. Search / Monitor Projection Service

## 2. Main aggregates
- purchase_order
- purchase_order_revision
- purchase_order_line
- purchase_supplier_acknowledgement
- purchase_receipt_expectation
- purchase_order_cancellation

## 3. Inbound dependencies
From 11.procurement:
- approved supplier decision reference
- approved purchase request reference

From 52.master-data:
- supplier reference
- item reference
- warehouse reference
- payment term reference

## 4. Outbound surfaces
To 12.inventory:
- expected inbound reference
- ordered/open quantity reference

To 13.warehouse:
- receiving expectation payload

To 30.accounting:
- purchase/accrual reference only

To 18.costing:
- purchase price reference only

## 5. Architecture rule
Purchase owns supplier-facing order commitment canon.
Receipt, stock balance, and warehouse task execution remain outside 10.purchase.
