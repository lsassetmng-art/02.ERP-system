# ============================================================
# PURCHASE INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 10.purchase

## 1. Create PO
POST /purchase/orders

request example:
{
  "supplier_id": "uuid",
  "currency_code": "JPY",
  "expected_receipt_date": "2026-06-10",
  "lines": [
    {
      "item_id": "uuid",
      "ordered_quantity": 100,
      "unit_price": 850
    }
  ]
}

## 2. Receipt expectation payload
{
  "source_module": "10.purchase",
  "purchase_order_id": "uuid",
  "purchase_order_number": "PO-2026-000001",
  "supplier_id": "uuid",
  "expected_receipt_date": "2026-06-10",
  "lines": [
    {
      "line_no": 1,
      "item_id": "uuid",
      "ordered_quantity": 100,
      "open_quantity": 100
    }
  ]
}

## 3. Rule
Purchase emits expectation/reference payloads.
Inventory and Warehouse own execution truth after receipt starts.
