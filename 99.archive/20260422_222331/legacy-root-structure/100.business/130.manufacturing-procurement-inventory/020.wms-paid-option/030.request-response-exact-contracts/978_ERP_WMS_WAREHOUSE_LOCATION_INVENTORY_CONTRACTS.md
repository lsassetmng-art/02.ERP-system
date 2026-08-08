# ============================================================
# ERP WMS WAREHOUSE LOCATION INVENTORY CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-978
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.warehouse_location_inventory_contracts
component: wms-warehouse-location-inventory-contracts


# LOCATION LIST REQUEST BODY

- warehouse_id
- zone_code_set
- location_type_code_set
- location_status_code_set
- pickable_flag
- putaway_allowed_flag
- page
- page_size


# INVENTORY LOT LIST RESPONSE DATA

- items
  - object_id
  - object_type = wms_inventory_lot
  - company_id
  - status
  - item_reference_code
  - lot_code
  - warehouse_id
  - location_id
  - on_hand_quantity
  - allocatable_quantity
  - lot_status_code
  - expiry_date
  - updated_at
- total_count
- page
- page_size


# RULE

Location update and inventory quantity adjustment
must remain distinct controlled actions.

