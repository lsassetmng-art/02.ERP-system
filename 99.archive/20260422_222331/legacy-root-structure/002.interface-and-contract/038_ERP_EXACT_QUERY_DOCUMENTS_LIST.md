# ============================================================
# ERP EXACT QUERY DOCUMENTS LIST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact query response contract shape
for ERP document list query.

endpoint:
GET /erp/documents

semantic_owner:
- layer: mixed
- note: interface list query over canonical document-facing truth

query_parameters:
- company_id optional
- document_type optional
- lifecycle_state optional
- scope_mode optional
- created_from optional
- created_to optional
- q optional
- language_code optional
- limit optional
- cursor optional

response_payload_shape:
- correlation_id
- items
- next_cursor
- warnings
- errors

items_item_shape:
- document_id
- company_id
- document_type
- lifecycle_state
- title_summary
- localized_title_summary optional
- owner_summary
- created_at
- updated_at
- approval_status_summary optional
- high_risk_flag

response_notes:
- lifecycle_state is document-family state
- localized_title_summary is display support only
- list query is read-only
- language_code affects localization support, not source-of-truth ownership

non_goals:
- action authority guarantee
- full history payload
- full domain detail payload
