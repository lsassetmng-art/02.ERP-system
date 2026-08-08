# ============================================================
# ERP EXACT PAYLOAD ACCOUNTING PERIOD CLOSE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact action payload and response contract shape
for accounting period close.

endpoint:
POST /erp/accounting/periods/{period_id}/close

semantic_owner:
- layer: 100.business
- module: 140.accounting

path_parameters:
- period_id

request_payload_shape:
- close_reason_code optional
- close_reason_text optional
- force_flag optional only if canonically allowed
- idempotency_key optional but recommended

request_notes:
- close is an accounting action
- governance or approval may gate close under policy
- request payload must not claim locked/final legal immutability unless explicitly part of same action scope

response_payload_shape:
- correlation_id
- action_result
- accounting_period_id
- resulting_period_status
- blocker_summary optional
- emitted_events optional
- downstream_processing_candidate
- warnings
- errors

response_notes:
- action_accepted means close action accepted in accounting scope
- resulting_period_status should normally be closed when same-scope successful
- blocker_summary explains close blockers when blocked/rejected
- action_accepted does not mean all follow-up reporting is complete

non_goals:
- management report completion
- forecast refresh completion
- irreversible legal lock unless explicitly modeled
