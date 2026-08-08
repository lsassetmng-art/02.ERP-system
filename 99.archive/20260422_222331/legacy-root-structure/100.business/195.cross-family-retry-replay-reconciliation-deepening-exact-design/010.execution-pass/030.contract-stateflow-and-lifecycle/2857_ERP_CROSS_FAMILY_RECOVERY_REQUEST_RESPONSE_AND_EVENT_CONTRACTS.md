# ============================================================
# ERP CROSS FAMILY RECOVERY REQUEST RESPONSE AND EVENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2857
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cross_family_recovery.request_response_and_event.contracts
component: cross-family-recovery-request-response-and-event-contracts


# OFFICIAL RECOVERY EVENT NAMES

- retry_queued
- retry_started
- retry_completed
- retry_failed
- replay_requested
- replay_started
- replay_completed
- reconciliation_detected
- reconciliation_resolved
- dead_letter_moved
- merge_started
- merge_completed

# MINIMUM CONTRACT FIELDS

- recovery_event_id
- company_id
- linked_handoff_id
- linked_event_id
- recovery_contract_type_code
- recovery_contract_version
- recovery_event_type_code
- event_occurred_at
- correlation_id
- replay_token
- actor_reference_code
- recovery_status_code
- summary_text

