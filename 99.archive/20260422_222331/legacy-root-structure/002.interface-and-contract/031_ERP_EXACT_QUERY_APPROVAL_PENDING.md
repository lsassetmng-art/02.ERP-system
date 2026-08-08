# ============================================================
# ERP EXACT QUERY APPROVAL PENDING
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact query response contract shape
for pending approval list.

endpoint:
GET /erp/approvals/pending

semantic_owner:
- layer: 200.management
- module: 270.approval

query_parameters:
- include_delegated optional
- company_id optional
- limit optional
- cursor optional

response_payload_shape:
- correlation_id
- items
- next_cursor
- warnings
- errors

items_item_shape:
- approval_request_id
- target_document_id
- target_document_type
- approval_status
- current_lane
- submitted_at
- requester_summary
- company_id

response_notes:
- approval_status is approval-family state only
- list visibility does not imply caller may mutate every row
- next_cursor is pagination scope only

non_goals:
- approval action authority guarantee
- business finalization guarantee
- full approval history payload
