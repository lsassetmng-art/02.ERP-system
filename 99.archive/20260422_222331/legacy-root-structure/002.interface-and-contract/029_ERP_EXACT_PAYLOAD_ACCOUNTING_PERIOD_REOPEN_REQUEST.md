# ============================================================
# ERP EXACT PAYLOAD ACCOUNTING PERIOD REOPEN REQUEST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact request payload and response contract shape
for accounting period reopen request.

endpoint:
POST /erp/accounting/periods/{period_id}/reopen-request

semantic_owner:
- layer: 200.management
- module: 260.governance

path_parameters:
- period_id

request_payload_shape:
- reopen_reason_code required
- reopen_reason_text optional but strongly recommended
- requested_scope_code optional
- supporting_refs optional
- idempotency_key optional but recommended

supporting_refs_item_shape:
- ref_type
- ref_id

request_notes:
- reopen-request is governance request truth
- payload must not claim period reopened directly
- payload must not claim accounting rollback completed

response_payload_shape:
- correlation_id
- request_id
- request_status
- acceptance_status
- mapped_record_id optional
- mapped_record_type
- review_required
- warnings
- errors

response_notes:
- accepted_for_review means governance review path started
- mapped_record_type should normally be reopen_request or governance_request
- accepted_for_review does not mean resulting period_status=open

non_goals:
- period reopened
- journal reopening effects completed
- blocker removal completed
