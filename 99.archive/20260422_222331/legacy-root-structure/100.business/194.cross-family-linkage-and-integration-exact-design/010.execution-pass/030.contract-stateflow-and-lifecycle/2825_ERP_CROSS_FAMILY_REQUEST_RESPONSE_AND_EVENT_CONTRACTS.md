# ============================================================
# ERP CROSS FAMILY REQUEST RESPONSE AND EVENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2825
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cross_family.request_response_and_event.contracts
component: cross-family-request-response-and-event-contracts


# OFFICIAL EVENT NAMES

- handoff_created
- handoff_acknowledged
- handoff_rejected
- handoff_completed
- handoff_failed
- handoff_retry_scheduled
- handoff_replayed
- handoff_canceled

# MINIMUM CONTRACT FIELDS

- event_id
- handoff_id
- company_id
- source_family
- target_family
- contract_type_code
- contract_version
- event_type_code
- event_occurred_at
- correlation_id
- replay_token
- actor_reference_code
- status_code
- summary_text

