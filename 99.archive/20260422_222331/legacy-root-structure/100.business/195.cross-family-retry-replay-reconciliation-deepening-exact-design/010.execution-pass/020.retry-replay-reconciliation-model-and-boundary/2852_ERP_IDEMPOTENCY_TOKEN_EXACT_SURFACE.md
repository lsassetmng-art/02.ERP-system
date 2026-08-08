# ============================================================
# ERP IDEMPOTENCY TOKEN EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2852
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.idempotency_token.exact_surface
component: idempotency-token-exact-surface


# SURFACE

idempotency_token_entry

Canonical fields:
- idempotency_token_entry_id
- company_id
- correlation_id
- replay_token
- contract_type_code
- source_family
- target_family
- token_state_code
- first_seen_at
- last_seen_at
- accepted_request_hash
- duplicate_detected_count
- token_expire_at
- created_at
- updated_at

