# ============================================================
# ERP EXACT QUERY SETTLEMENT DETAIL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact query response contract shape
for settlement detail query.

endpoint:
GET /erp/accounting/settlements/{settlement_id}

semantic_owner:
- layer: 100.business
- module: 140.accounting

path_parameters:
- settlement_id

query_parameters:
- include_lines optional
- include_source_summary optional
- include_target_summaries optional
- language_code optional

response_payload_shape:
- correlation_id
- settlement_id
- company_id
- settlement_type
- settlement_status
- settlement_currency_code
- total_applied_amount
- applied_at
- source_summary optional
- lines optional
- warnings
- errors

lines_item_shape:
- target_kind
- target_id
- applied_amount
- difference_amount optional
- difference_code optional

response_notes:
- settlement_currency_code is required for monetary clarity
- lines are settlement detail, not a replacement for AR/AP detail queries
- query does not mutate settlement truth

non_goals:
- reversal execution
- journal posting execution
- analytics refresh execution
