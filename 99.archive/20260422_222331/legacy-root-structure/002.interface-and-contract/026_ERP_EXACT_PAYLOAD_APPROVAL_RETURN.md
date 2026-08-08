# ============================================================
# ERP EXACT PAYLOAD APPROVAL RETURN
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact action payload and response contract shape
for approval return action.

endpoint:
POST /erp/approvals/{approval_request_id}/return

semantic_owner:
- layer: 200.management
- module: 270.approval

path_parameters:
- approval_request_id

request_payload_shape:
- return_reason_code required
- return_reason_text optional but recommended
- comment optional
- idempotency_key optional but recommended

request_notes:
- return requires explicit correction/rework reason
- payload must not directly claim resulting document lifecycle state unless separately computed later

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
- action_accepted means return action recorded in approval scope
- resulting_approval_status should normally be returned
- downstream_processing_candidate may be true if document rework path is triggered later
- action_accepted does not itself guarantee document lifecycle mutation unless explicitly same-scope

non_goals:
- document resubmission completion
- business correction completion
- workflow completion
