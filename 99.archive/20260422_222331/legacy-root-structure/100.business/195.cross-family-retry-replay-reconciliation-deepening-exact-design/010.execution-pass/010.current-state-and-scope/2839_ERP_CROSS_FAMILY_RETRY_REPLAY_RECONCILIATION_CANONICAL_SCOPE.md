# ============================================================
# ERP CROSS FAMILY RETRY REPLAY RECONCILIATION CANONICAL SCOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2839
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cross_family_retry_replay_reconciliation.canonical_scope
component: cross-family-retry-replay-reconciliation-canonical-scope


# IN SCOPE

- retry queue contract
- replay audit contract
- reconciliation ledger contract
- dead-letter contract
- partial recovery contract
- late-arriving event merge contract
- idempotency token contract
- retry and replay statusflow
- failure recovery visibility
- reconciliation reporting visibility

# OUT OF SCOPE FOR THIS PASS

- connector-specific middleware source code
- infra queue engine redesign
- external event bus redesign
- UI implementation source code

