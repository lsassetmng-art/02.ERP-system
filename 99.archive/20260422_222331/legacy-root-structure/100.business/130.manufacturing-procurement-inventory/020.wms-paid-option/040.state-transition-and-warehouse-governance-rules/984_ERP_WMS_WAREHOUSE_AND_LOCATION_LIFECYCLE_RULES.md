# ============================================================
# ERP WMS WAREHOUSE AND LOCATION LIFECYCLE RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-984
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.warehouse_and_location.lifecycle_rules
component: wms-warehouse-and-location-lifecycle-rules


# WAREHOUSE STATUS SET

- draft
- active
- suspended
- retired
- archived


# LOCATION STATUS SET

- draft
- active
- blocked
- retired
- archived


# RULE

Suspended warehouse is not retired warehouse.
Blocked location remains historically visible and distinct from archived location.

