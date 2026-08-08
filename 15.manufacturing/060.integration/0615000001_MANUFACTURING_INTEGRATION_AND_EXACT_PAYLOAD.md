# ============================================================
# MANUFACTURING INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 15.manufacturing

Production completion payload example:
{
  "source_module": "15.manufacturing",
  "mfg_production_order_id": "uuid",
  "production_order_number": "MO-2026-000001",
  "item_id": "uuid",
  "completed_quantity": 100,
  "scrapped_quantity": 2,
  "completed_at": "2026-04-22T20:00:00+09:00"
}

Rule:
- Manufacturing emits completion and actual-consumption references
- Inventory, Quality, and Costing own their own canon after receipt
