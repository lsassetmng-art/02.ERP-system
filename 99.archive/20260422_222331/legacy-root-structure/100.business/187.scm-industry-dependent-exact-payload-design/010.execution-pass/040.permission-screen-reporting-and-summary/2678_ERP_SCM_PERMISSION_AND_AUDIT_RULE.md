# ============================================================
# ERP SCM PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2678
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.scm.permission_and_audit.rule
component: scm-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- scm_read
- scm_node_manage
- scm_transfer_manage
- scm_commitment_manage
- scm_exception_manage
- scm_risk_manage
- scm_export
- scm_audit_read
- scm_override

# RULE

Transfer manage does not imply override.
Risk manage does not imply export.
Read does not imply commitment manage.

