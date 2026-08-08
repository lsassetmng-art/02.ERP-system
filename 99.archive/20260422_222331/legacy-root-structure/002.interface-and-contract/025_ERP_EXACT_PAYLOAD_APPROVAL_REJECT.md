# ============================================================
# ERP EXACT PAYLOAD APPROVAL REJECT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact action payload and response contract shape
for approval reject action.

endpoint:
POST /erp/approvals/{approval_request_id}/reject

semantic_owner:
- layer: 200.management
- module: 270.approval

path_parameters:
- approval_request_id

request_payload_shape:
- rejection_reason_code required
- rejection_reason_text optional but recommended
- comment optional
- idempotency_key optional but recommended

request_notes:
- reject should normally require explicit reason code
- payload must not assert final cancellation of business truth unless separately modeled

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
- action_accepted means reject action recorded in approval scope
- resulting_approval_status should normally be rejected
- downstream_processing_candidate may still exist for cleanup/notification
- action_accepted does not mean all downstream effects are complete

non_goals:
- business rollback completion
- document cancellation completion
- full notification delivery completion
