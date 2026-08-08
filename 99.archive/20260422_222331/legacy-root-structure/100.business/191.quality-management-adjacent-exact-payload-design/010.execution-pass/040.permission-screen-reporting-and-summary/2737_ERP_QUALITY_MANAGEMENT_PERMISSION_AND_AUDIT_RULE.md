# ============================================================
# ERP QUALITY MANAGEMENT PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2737
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_management.permission_and_audit.rule
component: quality-management-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- quality_read
- quality_inspection_manage
- quality_nonconformance_manage
- quality_hold_manage
- quality_corrective_action_manage
- quality_release_manage
- quality_export
- quality_audit_read
- quality_override

# RULE

Hold manage does not imply override.
Release manage does not imply export.
Read does not imply corrective-action manage.

