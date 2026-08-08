# ============================================================
# PURCHASE MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 10.purchase

## 1. Canonical entities
- purchase_order
- purchase_order_revision
- purchase_order_line
- purchase_supplier_acknowledgement
- purchase_receipt_expectation
- purchase_order_cancellation

## 2. Key fields
purchase_order:
- purchase_order_id
- purchase_order_number
- supplier_id
- po_status
- order_date
- expected_receipt_date
- currency_code
- latest_revision_no

purchase_order_line:
- purchase_order_line_id
- purchase_order_revision_id
- line_no
- item_id
- ordered_quantity
- open_quantity
- received_quantity
- cancelled_quantity
- unit_price

## 3. Status canon
- draft
- reviewed
- issued
- acknowledged
- partially_received
- received
- cancelled
- closed

## 4. Invariants
- received + cancelled must not exceed ordered quantity
- issued revision snapshot is immutable
- receipt expectation handoff must be idempotent
