# ============================================================
# PRODUCTION PLANNING INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 16.production-planning

Release recommendation payload example:
{
  "source_module": "16.production-planning",
  "plan_version_id": "uuid",
  "item_id": "uuid",
  "recommended_quantity": 100,
  "recommended_start_at": "2026-04-23T08:00:00+09:00",
  "recommended_end_at": "2026-04-24T18:00:00+09:00",
  "work_center_id": "uuid"
}
