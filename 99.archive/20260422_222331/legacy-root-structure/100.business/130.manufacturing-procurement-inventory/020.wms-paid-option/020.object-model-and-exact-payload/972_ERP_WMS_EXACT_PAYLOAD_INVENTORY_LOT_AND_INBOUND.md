# ============================================================
# ERP WMS EXACT PAYLOAD INVENTORY LOT AND INBOUND
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-972
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.exact_payload.inventory_lot_and_inbound
component: wms-exact-payload-inventory-lot-and-inbound


# OBJECT 1

wms_inventory_lot

Canonical payload:
- object_id
- company_id
- object_type = wms_inventory_lot
- status
- item_reference_code
- lot_code
- warehouse_id
- location_id
- on_hand_quantity
- allocatable_quantity
- lot_status_code
- receipt_reference_code
- expiry_date
- quality_hold_flag
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

wms_inbound_receipt

Canonical payload:
- object_id
- company_id
- object_type = wms_inbound_receipt
- status
- receipt_code
- warehouse_id
- supplier_reference_code
- expected_receipt_date
- actual_receipt_date
- receipt_status_code
- received_item_count
- received_quantity_total
- putaway_completion_flag
- created_at
- created_by
- updated_at
- updated_by


# RULE

Inventory lot is stock-state truth at a specific physical place.
Inbound receipt is receiving execution event truth.

