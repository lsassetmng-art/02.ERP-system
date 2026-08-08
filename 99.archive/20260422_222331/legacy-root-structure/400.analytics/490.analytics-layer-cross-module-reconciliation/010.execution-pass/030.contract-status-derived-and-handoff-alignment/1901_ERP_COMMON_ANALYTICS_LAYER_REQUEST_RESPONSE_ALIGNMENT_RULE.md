# ============================================================
# ERP COMMON ANALYTICS LAYER REQUEST RESPONSE ALIGNMENT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1901
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.common_analytics_layer.request_response_alignment_rule
component: common-analytics-layer-request-response-alignment-rule


# RULE

Analytics-layer write contracts may specialize,
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

