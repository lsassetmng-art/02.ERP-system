# ============================================================
# ERP WMS OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-969
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.object_family_set
component: wms-object-family-set


# PRIMARY OBJECT FAMILIES

- wms_warehouse
- wms_location
- wms_inventory_lot
- wms_inbound_receipt
- wms_outbound_pick_execution
- wms_stock_movement
- wms_count_session
- wms_discrepancy_record


# RULE

Warehouse is not location.
Inventory lot is not inbound receipt.
Outbound pick execution is not stock movement.
Count session is not discrepancy record.

