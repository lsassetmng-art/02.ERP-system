# ============================================================
# ERP EXACT QUERY APPROVAL DETAIL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact query response contract shape
for approval detail.

endpoint:
GET /erp/approvals/{approval_request_id}

semantic_owner:
- layer: 200.management
- module: 270.approval

path_parameters:
- approval_request_id

query_parameters:
- include_actions optional
- include_target_document_summary optional
- include_lane_history optional

response_payload_shape:
- correlation_id
- approval_request_id
- approval_status
- current_lane
- target_document
- requester_summary
- actions optional
- lane_history optional
- warnings
- errors

target_document_shape:
- document_id
- document_type
- lifecycle_state

response_notes:
- approval_status and target_document.lifecycle_state are different scopes
- actions are approval action history summaries, not audit replacement
- query does not mutate approval truth

non_goals:
- action execution
- business document mutation
- workflow completion
