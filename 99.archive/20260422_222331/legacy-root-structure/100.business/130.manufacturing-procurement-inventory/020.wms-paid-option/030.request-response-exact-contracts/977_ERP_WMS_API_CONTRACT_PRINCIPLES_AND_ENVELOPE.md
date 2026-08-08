# ============================================================
# ERP WMS API CONTRACT PRINCIPLES AND ENVELOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-977
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.api_contract_principles_and_envelope
component: wms-api-contract-principles-and-envelope


# COMMON REQUEST ENVELOPE

- request_id
- company_id
- actor_user_id
- actor_role_set
- wms_option_expected_state
- body


# COMMON RESPONSE ENVELOPE

- request_id
- company_id
- module = wms_paid_option
- contract_version
- status_code
- success_flag
- message_code
- data
- warnings
- error
- audit_context


# ERROR SHAPE

- error_code
- error_message
- error_domain
- retryable_flag
- missing_permission_code
- missing_option_code
- invalid_field_set

