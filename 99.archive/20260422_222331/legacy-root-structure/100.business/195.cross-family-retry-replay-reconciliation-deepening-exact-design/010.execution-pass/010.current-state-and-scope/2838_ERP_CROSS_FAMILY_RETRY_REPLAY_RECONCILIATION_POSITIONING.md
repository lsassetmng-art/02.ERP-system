# ============================================================
# ERP CROSS FAMILY RETRY REPLAY RECONCILIATION POSITIONING
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2838
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cross_family_retry_replay_reconciliation.positioning
component: cross-family-retry-replay-reconciliation-positioning


# POSITIONING

Retry / replay / reconciliation is the ERP-side
official recovery and consistency line for cross-family contracts.

It owns:
- retry contract interpretation
- replay audit interpretation
- reconciliation ledger interpretation
- dead-letter workflow interpretation
- partial recovery interpretation
- late-arriving event merge interpretation
- idempotency token interpretation

It does not replace family-owned truth.
It governs integration recovery semantics only.

