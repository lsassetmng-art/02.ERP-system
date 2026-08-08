# ============================================================
# WAREHOUSE INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 13.warehouse

Execution completion payload example:
{
  "source_module": "13.warehouse",
  "warehouse_task_id": "uuid",
  "task_type": "receiving",
  "item_id": "uuid",
  "completed_quantity": 100,
  "warehouse_id": "uuid",
  "completed_at": "2026-04-22T18:00:00+09:00"
}
