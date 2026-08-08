# ============================================================
# ERP EXACT PAYLOAD APPROVAL APPROVE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact action payload and response contract shape
for approval approve action.

endpoint:
POST /erp/approvals/{approval_request_id}/approve

semantic_owner:
- layer: 200.management
- module: 270.approval

path_parameters:
- approval_request_id

request_payload_shape:
- approval_request_id implicit from path
- action_reason_code optional
- action_reason_text optional
- comment optional
- idempotency_key optional but recommended

request_notes:
- approve is an action payload, not a request for generic processing
- payload must not assert resulting approved state directly
- payload must not assert business finalization directly

response_payload_shape:
- correlation_id
- action_result
- approval_request_id
- resulting_approval_status
- emitted_events optional
- downstream_processing_candidate
- warnings
- errors

response_notes:
- action_accepted means approval action recorded in scope
- resulting_approval_status is approval-state scope only
- downstream_processing_candidate may be true if later business progression follows
- action_accepted does not mean business document finalized by default

non_goals:
- business finalization completion
- accounting posting
- payment execution
