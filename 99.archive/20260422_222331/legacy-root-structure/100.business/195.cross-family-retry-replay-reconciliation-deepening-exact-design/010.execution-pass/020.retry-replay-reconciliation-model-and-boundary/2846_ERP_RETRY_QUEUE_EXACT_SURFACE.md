# ============================================================
# ERP RETRY QUEUE EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2846
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.retry_queue.exact_surface
component: retry-queue-exact-surface


# SURFACE

retry_queue_entry

Canonical fields:
- retry_queue_entry_id
- company_id
- linked_handoff_id
- linked_event_id
- source_family
- target_family
- retry_reason_code
- retry_attempt_number
- max_retry_limit
- next_retry_at
- retry_priority_code
- last_failure_summary_text
- retry_state_code
- created_at
- updated_at

