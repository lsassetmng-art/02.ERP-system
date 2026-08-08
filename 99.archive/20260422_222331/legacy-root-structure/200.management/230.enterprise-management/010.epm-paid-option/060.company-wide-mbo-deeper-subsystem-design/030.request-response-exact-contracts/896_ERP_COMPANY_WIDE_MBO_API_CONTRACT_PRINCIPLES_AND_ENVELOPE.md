# ============================================================
# ERP COMPANY WIDE MBO API CONTRACT PRINCIPLES AND ENVELOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-896
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.api_contract_principles_and_envelope
component: company-wide-mbo-api-contract-principles-and-envelope


# COMMON REQUEST ENVELOPE

- request_id
- company_id
- actor_user_id
- actor_role_set
- epm_option_expected_state
- company_wide_mbo_expected_state
- body


# COMMON RESPONSE ENVELOPE

- request_id
- company_id
- module = company_wide_mbo_subsystem
- contract_version
- status_code
- success_flag
- message_code
- data
- warnings
- error
- audit_context

