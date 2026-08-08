# ============================================================
# ERP CROSS FAMILY PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2833
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cross_family.permission_and_audit.rule
component: cross-family-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- cross_family_read
- cross_family_contract_manage
- cross_family_retry_manage
- cross_family_replay_manage
- cross_family_export
- cross_family_audit_read
- cross_family_override

# RULE

Replay manage does not imply override.
Contract manage does not imply export.
Read does not imply retry manage.

