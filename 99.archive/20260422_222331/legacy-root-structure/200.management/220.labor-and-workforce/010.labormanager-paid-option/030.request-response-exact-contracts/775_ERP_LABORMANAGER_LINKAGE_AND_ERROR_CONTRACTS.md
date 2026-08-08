# ============================================================
# ERP LABORMANAGER LINKAGE AND ERROR CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-775
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.linkage_and_error_contracts
component: labormanager-linkage-and-error-contracts


# LINKAGE LOOKUP RESPONSE DATA

- labormanager_option_enabled_flag
- linked_staff_exists_flag
- linked_staff
  - object_id
  - object_type = labor_staff_profile
  - display_name
  - primary_department_code
  - employment_type_code
- linkage_status_code


# REPRESENTATIVE ERROR CODES

- LABORMANAGER_OPTION_NOT_ENABLED
- LABORMANAGER_OPTION_SUSPENDED
- LABORMANAGER_PERMISSION_DENIED
- LABORMANAGER_OBJECT_NOT_FOUND
- LABORMANAGER_INVALID_STATUS_TRANSITION
- LABORMANAGER_COMPLIANCE_BLOCKING_CONDITION
- LABORMANAGER_MISSING_REQUIRED_FIELD

