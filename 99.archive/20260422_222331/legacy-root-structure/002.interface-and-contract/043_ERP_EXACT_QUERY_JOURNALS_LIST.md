# ============================================================
# ERP EXACT QUERY JOURNALS LIST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact query response contract shape
for journal list query.

endpoint:
GET /erp/accounting/journals

semantic_owner:
- layer: 100.business
- module: 140.accounting

query_parameters:
- company_id optional
- journal_status optional
- accounting_period_id optional
- source_document_id optional
- source_event_id optional
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
- journal_id
- journal_status
- accounting_period_id
- currency_code
- total_debit
- total_credit
- source_summary optional
- created_at
- posted_at optional

response_notes:
- currency_code must be explicit
- journal_status belongs to accounting_record_state family
- query is read-only

non_goals:
- posting execution
- reversal execution
- close action execution
