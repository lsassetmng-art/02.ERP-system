# ============================================================
# PROCUREMENT INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 11.procurement

PO request payload example:
{
  "source_module": "11.procurement",
  "procurement_request_id": "uuid",
  "awarded_supplier_id": "uuid",
  "currency_code": "JPY",
  "lines": [
    {
      "item_id": "uuid",
      "ordered_quantity": 100,
      "recommended_unit_price": 850
    }
  ]
}
