# ============================================================
# ERP CRM OPTION COMMON REQUEST RESPONSE ENVELOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-613
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.common_request_response_envelope
component: crm-option-common-request-response-envelope


# COMMON REQUEST ENVELOPE

Recommended request envelope:

- request_id
- company_id
- actor_user_id
- actor_role_set
- crm_option_expected_state
- body


# COMMON RESPONSE ENVELOPE

Recommended response envelope:

- request_id
- company_id
- module = crm_paid_option
- contract_version
- status_code
- success_flag
- message_code
- data
- warnings
- error
- audit_context


# AUDIT CONTEXT

Recommended audit_context fields:

- audit_action_code
- audit_required_flag
- audit_object_set
- audit_result_code


# ERROR OBJECT

Recommended error shape:

- error_code
- error_message
- error_domain
- retryable_flag
- missing_permission_code
- missing_option_code
- invalid_field_set

