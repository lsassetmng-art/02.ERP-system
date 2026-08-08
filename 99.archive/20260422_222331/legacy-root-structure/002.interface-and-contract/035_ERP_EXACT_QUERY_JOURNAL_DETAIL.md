# ============================================================
# ERP EXACT QUERY JOURNAL DETAIL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact query response contract shape
for journal detail.

endpoint:
GET /erp/accounting/journals/{journal_id}

semantic_owner:
- layer: 100.business
- module: 140.accounting

path_parameters:
- journal_id

query_parameters:
- include_lines optional
- include_source_summary optional

response_payload_shape:
- correlation_id
- journal_id
- journal_status
- accounting_period_id
- source_summary optional
- lines optional
- warnings
- errors

source_summary_shape:
- source_document_id optional
- source_event_id optional

lines_item_shape:
- line_no
- account_code
- debit_amount
- credit_amount

response_notes:
- journal_status belongs to accounting_record_state family
- source_summary is linkage summary only
- query does not mutate journal truth

non_goals:
- posting
- reversal
- close action
