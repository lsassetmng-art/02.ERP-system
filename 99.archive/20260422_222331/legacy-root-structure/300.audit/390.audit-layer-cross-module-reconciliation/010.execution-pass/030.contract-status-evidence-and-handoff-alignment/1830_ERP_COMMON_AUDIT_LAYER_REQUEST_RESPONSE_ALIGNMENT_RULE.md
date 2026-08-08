# ============================================================
# ERP COMMON AUDIT LAYER REQUEST RESPONSE ALIGNMENT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1830
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.common_audit_layer.request_response_alignment_rule
component: common-audit-layer-request-response-alignment-rule


# RULE

Audit-layer write contracts may specialize,
but should remain reconcilable to the common ERP baseline:

Request side:
- request_id
- company_id
- actor_user_id
- actor_role_set
- body

Response side:
- request_id
- company_id
- module
- contract_version
- status_code
- success_flag
- message_code
- data
- warnings
- error
- audit_context

