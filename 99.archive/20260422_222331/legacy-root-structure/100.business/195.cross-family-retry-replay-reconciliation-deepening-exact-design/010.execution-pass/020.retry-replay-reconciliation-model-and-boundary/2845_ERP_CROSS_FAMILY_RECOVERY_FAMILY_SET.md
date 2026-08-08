# ============================================================
# ERP CROSS FAMILY RECOVERY FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2845
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cross_family_recovery.family_set
component: cross-family-recovery-family-set


# PRIMARY RECOVERY FAMILIES

- retry_queue_contract
- replay_audit_contract
- reconciliation_ledger_contract
- dead_letter_contract
- partial_handoff_recovery_contract
- late_arriving_event_merge_contract
- idempotency_token_contract

