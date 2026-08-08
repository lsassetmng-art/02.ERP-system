# ============================================================
# ERP WMS EXACT PAYLOAD OUTBOUND AND MOVEMENT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-973
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.exact_payload.outbound_and_movement
component: wms-exact-payload-outbound-and-movement


# OBJECT 1

wms_outbound_pick_execution

Canonical payload:
- object_id
- company_id
- object_type = wms_outbound_pick_execution
- status
- pick_execution_code
- warehouse_id
- source_location_id
- item_reference_code
- lot_id
- pick_status_code
- required_ship_date
- picked_quantity
- packed_quantity
- dispatch_reference_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

wms_stock_movement

Canonical payload:
- object_id
- company_id
- object_type = wms_stock_movement
- status
- movement_code
- warehouse_id
- from_location_id
- to_location_id
- item_reference_code
- lot_id
- moved_quantity
- movement_status_code
- movement_reason_code
- executed_at
- executed_by
- created_at
- created_by
- updated_at
- updated_by


# RULE

Outbound pick execution is outbound warehouse action truth.
Stock movement is generic internal physical movement truth.

