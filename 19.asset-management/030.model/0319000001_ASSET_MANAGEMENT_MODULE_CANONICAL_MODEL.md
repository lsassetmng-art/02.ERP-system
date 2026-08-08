# ============================================================
# ASSET MANAGEMENT MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 19.asset-management

Entities:
- asset_equipment_register
- asset_maintenance_plan
- asset_maintenance_request
- asset_utilization_record
- asset_downtime_record
- asset_maintenance_completion

Status canon:
- active
- under_maintenance
- available
- unavailable
- retired
