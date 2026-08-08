# ============================================================
# ERP CRM OPTION REQUEST RESPONSE EXACT CONTRACTS CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-611
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.request_response_exact_contracts.current_state
component: crm-option-request-response-exact-contracts-current-state


# ABSTRACT

Defines the current state for the first request/response
exact contract pass for the CRM paid option.

The previous pass fixed:
- CRM is a paid option
- CRM is not mandatory ERP core
- CRM object families are explicit
- CRM payload exactness is explicit

This pass fixes:
- common API contract rules
- request exactness
- response exactness
- enablement-aware contract behavior
- error and permission contract shape


# GOAL

This pass is not implementation code.

This pass is exact API design shape for:
- request fields
- response fields
- envelope format
- enablement behavior
- permission and audit reflection


# CONSTRAINTS

Do not design contracts as if CRM is always enabled.

Do not let CRM-rich responses become hidden ERP core assumptions.

Do not mix exact fields with vague response blobs.

