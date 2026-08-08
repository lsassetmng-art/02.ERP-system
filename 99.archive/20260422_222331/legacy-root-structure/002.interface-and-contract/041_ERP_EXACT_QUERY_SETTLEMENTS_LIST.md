# ============================================================
# ERP EXACT QUERY SETTLEMENTS LIST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact query response contract shape
for settlement list query.

endpoint:
GET /erp/accounting/settlements

semantic_owner:
- layer: 100.business
- module: 140.accounting

query_parameters:
- company_id optional
- settlement_type optional
- settlement_status optional
- source_document_id optional
- applied_from optional
- applied_to optional
- currency_code optional
- limit optional
- cursor optional

response_payload_shape:
- correlation_id
- items
- next_cursor
- warnings
- errors

items_item_shape:
- settlement_id
- settlement_type
- settlement_status
- settlement_currency_code
- total_applied_amount
- applied_at
- source_summary optional
- target_count

response_notes:
- settlement_currency_code must be explicit
- settlement_status is settlement-family state only
- list query is read-only

non_goals:
- settlement reversal
- accounting posting guarantee
- dashboard/report refresh guarantee
