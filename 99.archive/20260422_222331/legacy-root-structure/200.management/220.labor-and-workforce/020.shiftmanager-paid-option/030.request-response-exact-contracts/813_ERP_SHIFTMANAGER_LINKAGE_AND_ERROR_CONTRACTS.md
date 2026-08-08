# ============================================================
# ERP SHIFTMANAGER LINKAGE AND ERROR CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-813
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.linkage_and_error_contracts
component: shiftmanager-linkage-and-error-contracts


# LINKAGE LOOKUP RESPONSE DATA

- shiftmanager_option_enabled_flag
- linked_plan_exists_flag
- linkage_status_code


# REPRESENTATIVE ERROR CODES

- SHIFTMANAGER_OPTION_NOT_ENABLED
- SHIFTMANAGER_OPTION_SUSPENDED
- SHIFTMANAGER_PERMISSION_DENIED
- SHIFTMANAGER_OBJECT_NOT_FOUND
- SHIFTMANAGER_INVALID_STATUS_TRANSITION
- SHIFTMANAGER_STAFF_INELIGIBLE
- SHIFTMANAGER_CONSTRAINT_BLOCKING_CONDITION
- SHIFTMANAGER_MISSING_REQUIRED_FIELD

