# ============================================================
# ERP COMPANY WIDE MBO LINKAGE AND ERROR CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-899
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.linkage_and_error_contracts
component: company-wide-mbo-linkage-and-error-contracts


# LINKAGE LOOKUP RESPONSE DATA

- company_wide_mbo_enabled_flag
- linked_rolldown_exists_flag
- linkage_status_code


# REPRESENTATIVE ERROR CODES

- COMPANY_WIDE_MBO_NOT_ENABLED
- COMPANY_WIDE_MBO_PERMISSION_DENIED
- COMPANY_WIDE_MBO_OBJECT_NOT_FOUND
- COMPANY_WIDE_MBO_INVALID_STATUS_TRANSITION
- COMPANY_WIDE_MBO_REVIEW_WINDOW_BLOCKED
- COMPANY_WIDE_MBO_MISSING_REQUIRED_FIELD

