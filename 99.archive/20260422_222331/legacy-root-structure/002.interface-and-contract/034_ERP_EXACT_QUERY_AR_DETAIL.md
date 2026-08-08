# ============================================================
# ERP EXACT QUERY AR DETAIL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact query response contract shape
for accounts receivable detail.

endpoint:
GET /erp/accounting/receivables/{ar_id}

semantic_owner:
- layer: 100.business
- module: 140.accounting

path_parameters:
- ar_id

query_parameters:
- include_settlement_summary optional
- include_source_document_summary optional

response_payload_shape:
- correlation_id
- ar_id
- company_id
- balance_state
- original_amount
- open_amount
- currency_code
- due_date optional
- source_document_summary optional
- settlement_summary optional
- warnings
- errors

source_document_summary_shape:
- source_document_id
- source_document_type

settlement_summary_shape:
- settled_amount
- remaining_amount

response_notes:
- balance_state belongs to accounting balance family
- settlement_summary is summary only and not a replacement for settlement detail query
- query does not mutate AR truth

non_goals:
- settlement creation
- write-off execution
- collection action execution
