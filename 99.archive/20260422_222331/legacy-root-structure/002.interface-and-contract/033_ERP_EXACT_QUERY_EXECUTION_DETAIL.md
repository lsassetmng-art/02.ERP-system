# ============================================================
# ERP EXACT QUERY EXECUTION DETAIL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact query response contract shape
for execution detail.

endpoint:
GET /erp/executions/{execution_request_id}

semantic_owner:
- layer: 000.platform
- module: runtime-related platform ownership

path_parameters:
- execution_request_id

query_parameters:
- include_attempts optional
- include_results optional
- include_source_summary optional

response_payload_shape:
- correlation_id
- execution_request_id
- execution_status
- execution_type
- retry_count
- next_retry_at optional
- latest_attempt optional
- latest_result optional
- source_summary optional
- warnings
- errors

latest_attempt_shape:
- attempt_no
- started_at
- finished_at optional

latest_result_shape:
- result_status
- error_code optional
- error_message optional

response_notes:
- execution_status is runtime/execution family state only
- source_summary does not mean source workflow completed
- query is read-only

non_goals:
- retry execution
- source business completion guarantee
- downstream delivery guarantee
