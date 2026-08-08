# ============================================================
# ERP SCM LINKAGE AND ERROR CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1021
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.linkage_and_error_contracts
component: scm-linkage-and-error-contracts


# LINKAGE LOOKUP RESPONSE DATA

- scm_option_enabled_flag
- linked_supply_plan_exists_flag
- linkage_status_code


# REPRESENTATIVE ERROR CODES

- SCM_OPTION_NOT_ENABLED
- SCM_OPTION_SUSPENDED
- SCM_PERMISSION_DENIED
- SCM_OBJECT_NOT_FOUND
- SCM_INVALID_STATUS_TRANSITION
- SCM_LANE_CAPACITY_CONFLICT
- SCM_DISRUPTION_BLOCKING_CONDITION
- SCM_MISSING_REQUIRED_FIELD

