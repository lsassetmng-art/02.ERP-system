# ============================================================
# ERP EXACT PAYLOAD ACCOUNTING SETTLEMENT CREATE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact action payload and response contract shape
for settlement creation.

endpoint:
POST /erp/accounting/settlements

semantic_owner:
- layer: 100.business
- module: 140.accounting

request_payload_shape:
- company_id
- settlement_type
- settlement_currency_code
- source_ref
- target_items
- settlement_reason_code optional
- settlement_reason_text optional
- idempotency_key optional but recommended

source_ref_shape:
- source_kind
- source_id

target_items_shape:
- target_kind
- target_id
- applied_amount
- difference_amount optional
- difference_code optional

request_notes:
- payload expresses settlement intent
- payload must not assert posted journal state directly
- payload must not assert dashboard/report refresh completion

response_payload_shape:
- correlation_id
- action_result
- settlement_id optional
- resulting_settlement_status
- related_balance_effect_summary optional
- emitted_events optional
- downstream_processing_candidate
- warnings
- errors

response_notes:
- action_accepted means settlement handling accepted in settlement scope
- resulting_settlement_status is settlement-family scope only
- related_balance_effect_summary is not a replacement for authoritative AR/AP query
- action_accepted does not mean reporting/analytics completion

non_goals:
- journal posted guarantee
- dashboard refresh guarantee
- external sync guarantee
