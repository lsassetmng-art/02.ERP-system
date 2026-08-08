# ============================================================
# ERP CRM OPTION PERMISSION AND ENABLEMENT ERROR CONTRACT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-623
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.permission_and_enablement_error_contract
component: crm-option-permission-and-enablement-error-contract


# REPRESENTATIVE ERROR CODES

- CRM_OPTION_NOT_ENABLED
- CRM_OPTION_SUSPENDED
- CRM_PERMISSION_DENIED
- CRM_OBJECT_NOT_FOUND
- CRM_INVALID_STATUS_TRANSITION
- CRM_INVALID_LIFECYCLE_CHANGE
- CRM_INVALID_MERGE_REQUEST
- CRM_MISSING_REQUIRED_FIELD
- CRM_INVALID_REFERENCE_LINK
- CRM_AUDIT_REQUIRED_ACTION_BLOCKED


# EXACT ERROR RESPONSE

- request_id
- company_id
- module = crm_paid_option
- contract_version
- status_code
- success_flag = false
- message_code
- data = null
- warnings
- error
  - error_code
  - error_message
  - error_domain
  - retryable_flag
  - missing_permission_code
  - missing_option_code
  - invalid_field_set
- audit_context

