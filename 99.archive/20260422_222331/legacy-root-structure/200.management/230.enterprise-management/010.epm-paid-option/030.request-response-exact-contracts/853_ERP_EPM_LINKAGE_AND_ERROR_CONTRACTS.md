# ============================================================
# ERP EPM LINKAGE AND ERROR CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-853
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.linkage_and_error_contracts
component: epm-linkage-and-error-contracts


# LINKAGE LOOKUP RESPONSE DATA

- epm_option_enabled_flag
- linked_objective_exists_flag
- linkage_status_code


# REPRESENTATIVE ERROR CODES

- EPM_OPTION_NOT_ENABLED
- EPM_OPTION_SUSPENDED
- EPM_PERMISSION_DENIED
- EPM_OBJECT_NOT_FOUND
- EPM_INVALID_STATUS_TRANSITION
- EPM_REVIEW_WINDOW_BLOCKED
- EPM_MISSING_REQUIRED_FIELD

