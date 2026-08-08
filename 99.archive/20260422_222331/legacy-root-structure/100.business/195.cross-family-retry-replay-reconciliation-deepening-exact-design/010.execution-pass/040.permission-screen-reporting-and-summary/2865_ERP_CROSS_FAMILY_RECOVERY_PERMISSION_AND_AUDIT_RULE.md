# ============================================================
# ERP CROSS FAMILY RECOVERY PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2865
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cross_family_recovery.permission_and_audit.rule
component: cross-family-recovery-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- cross_family_recovery_read
- cross_family_retry_manage
- cross_family_replay_manage
- cross_family_reconciliation_manage
- cross_family_dead_letter_manage
- cross_family_recovery_export
- cross_family_recovery_audit_read
- cross_family_recovery_override

# RULE

Replay manage does not imply override.
Reconciliation manage does not imply export.
Read does not imply dead-letter manage.

