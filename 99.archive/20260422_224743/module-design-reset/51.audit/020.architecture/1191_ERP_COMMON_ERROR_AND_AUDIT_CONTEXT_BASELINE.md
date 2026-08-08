# ============================================================
# ERP COMMON ERROR AND AUDIT CONTEXT BASELINE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1191
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.common_error_and_audit_context.baseline
component: common-error-and-audit-context-baseline


# BASELINE

Representative common error fields:
- error_code
- error_message
- error_domain
- retryable_flag
- invalid_field_set

Representative common audit-context fields:
- actor_user_id
- actor_role_set
- source_module
- action_type
- action_at
- related_object_reference_set where relevant

