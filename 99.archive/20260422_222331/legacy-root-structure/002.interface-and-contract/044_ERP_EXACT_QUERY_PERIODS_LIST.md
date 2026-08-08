# ============================================================
# ERP EXACT QUERY PERIODS LIST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact query response contract shape
for accounting periods list query.

endpoint:
GET /erp/accounting/periods

semantic_owner:
- layer: 100.business
- module: 140.accounting

query_parameters:
- company_id optional
- fiscal_year optional
- period_status optional
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
- accounting_period_id
- period_code
- localized_period_label optional
- period_status
- start_date
- end_date
- closed_at optional
- locked_flag optional

response_notes:
- period_status belongs to period_state family
- localized_period_label is display support only
- query is read-only

non_goals:
- close execution
- reopen execution
- governance review execution
