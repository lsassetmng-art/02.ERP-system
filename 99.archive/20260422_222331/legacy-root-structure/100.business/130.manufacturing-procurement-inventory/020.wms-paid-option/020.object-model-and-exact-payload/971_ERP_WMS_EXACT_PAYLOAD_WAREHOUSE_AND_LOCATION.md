# ============================================================
# ERP WMS EXACT PAYLOAD WAREHOUSE AND LOCATION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-971
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.exact_payload.warehouse_and_location
component: wms-exact-payload-warehouse-and-location


# OBJECT 1

wms_warehouse

Canonical payload:
- object_id
- company_id
- object_type = wms_warehouse
- status
- warehouse_code
- warehouse_name
- warehouse_status_code
- site_reference_code
- default_receipt_location_code
- default_dispatch_location_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

wms_location

Canonical payload:
- object_id
- company_id
- object_type = wms_location
- status
- warehouse_id
- location_code
- location_status_code
- location_type_code
- zone_code
- aisle_code
- bin_code
- capacity_unit_code
- capacity_value
- pickable_flag
- putaway_allowed_flag
- created_at
- created_by
- updated_at
- updated_by


# RULE

Warehouse is the parent execution scope.
Location is the exact physical storage or execution position.

