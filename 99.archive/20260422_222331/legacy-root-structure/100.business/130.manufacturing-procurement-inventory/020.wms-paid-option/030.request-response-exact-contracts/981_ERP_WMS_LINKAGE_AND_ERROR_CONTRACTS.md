# ============================================================
# ERP WMS LINKAGE AND ERROR CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-981
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.linkage_and_error_contracts
component: wms-linkage-and-error-contracts


# LINKAGE LOOKUP RESPONSE DATA

- wms_option_enabled_flag
- linked_warehouse_exists_flag
- linkage_status_code


# REPRESENTATIVE ERROR CODES

- WMS_OPTION_NOT_ENABLED
- WMS_OPTION_SUSPENDED
- WMS_PERMISSION_DENIED
- WMS_OBJECT_NOT_FOUND
- WMS_INVALID_STATUS_TRANSITION
- WMS_LOCATION_CAPACITY_CONFLICT
- WMS_DISCREPANCY_BLOCKING_CONDITION
- WMS_MISSING_REQUIRED_FIELD

