# ============================================================
# ERP MRP LINKAGE AND ERROR CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-941
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.linkage_and_error_contracts
component: mrp-linkage-and-error-contracts


# LINKAGE LOOKUP RESPONSE DATA

- mrp_option_enabled_flag
- linked_run_exists_flag
- linkage_status_code


# REPRESENTATIVE ERROR CODES

- MRP_OPTION_NOT_ENABLED
- MRP_OPTION_SUSPENDED
- MRP_PERMISSION_DENIED
- MRP_OBJECT_NOT_FOUND
- MRP_INVALID_STATUS_TRANSITION
- MRP_BOM_EFFECTIVE_DATE_CONFLICT
- MRP_SHORTAGE_BLOCKING_CONDITION
- MRP_MISSING_REQUIRED_FIELD

