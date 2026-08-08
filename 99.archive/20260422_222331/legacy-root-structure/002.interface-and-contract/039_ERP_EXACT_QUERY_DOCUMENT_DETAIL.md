# ============================================================
# ERP EXACT QUERY DOCUMENT DETAIL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact query response contract shape
for ERP document detail query.

endpoint:
GET /erp/documents/{document_id}

semantic_owner:
- layer: mixed
- note: document-facing read over owning business/control truth

path_parameters:
- document_id

query_parameters:
- include_lines optional
- include_domain_payload optional
- include_approval_summary optional
- language_code optional

response_payload_shape:
- correlation_id
- document_id
- company_id
- document_type
- lifecycle_state
- header_summary
- localized_header_summary optional
- lines optional
- domain_payload optional
- approval_summary optional
- warnings
- errors

header_summary_shape:
- title_summary
- owner_actor_id
- created_at
- currency_code optional

response_notes:
- lifecycle_state and approval_summary.approval_status are different scopes
- localized_header_summary is display support only
- currency_code must be explicit where monetary meaning exists
- query is read-only

non_goals:
- document mutation
- approval action execution
- workflow completion
