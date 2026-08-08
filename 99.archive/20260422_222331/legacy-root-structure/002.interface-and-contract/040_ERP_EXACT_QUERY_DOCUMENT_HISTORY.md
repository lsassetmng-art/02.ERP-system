# ============================================================
# ERP EXACT QUERY DOCUMENT HISTORY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact query response contract shape
for ERP document history query.

endpoint:
GET /erp/documents/{document_id}/history

semantic_owner:
- layer: mixed
- note: history/timeline-facing read across document, approval, and event evidence

path_parameters:
- document_id

query_parameters:
- include_approval_actions optional
- include_events optional
- include_state_history optional
- language_code optional
- limit optional
- cursor optional

response_payload_shape:
- correlation_id
- document_id
- timeline
- next_cursor
- warnings
- errors

timeline_item_shape:
- occurred_at
- entry_type
- code
- summary
- localized_summary optional
- actor_summary optional

response_notes:
- timeline is history, not current state
- localized_summary is display support only
- query does not mutate any truth
- next_cursor is timeline pagination only

non_goals:
- current authoritative state replacement
- action execution
- audit rewrite
