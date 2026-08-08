# ============================================================
# ERP EXACT PAYLOAD EXECUTION RETRY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact action payload and response contract shape
for execution retry.

endpoint:
POST /erp/executions/{execution_request_id}/retry

semantic_owner:
- layer: 000.platform
- module: runtime-related platform ownership
- note: mainly event/integration/workflow runtime semantics

path_parameters:
- execution_request_id

request_payload_shape:
- retry_reason_code optional
- retry_reason_text optional
- force_flag optional only if canonically allowed
- idempotency_key optional but recommended

request_notes:
- retry is a runtime operation action
- payload must not claim execution succeeded
- payload must not claim source business completion

response_payload_shape:
- correlation_id
- action_result
- execution_request_id
- resulting_execution_status
- emitted_events optional
- downstream_processing_candidate
- warnings
- errors

response_notes:
- action_accepted means retry registered/accepted in retry scope
- resulting_execution_status will usually be retry_waiting or queued
- action_accepted does not mean execution_succeeded
- action_accepted does not mean downstream subscribers succeeded

non_goals:
- source business process completion
- accounting completion
- external delivery completion
