# ============================================================
# ERP COMPANY WIDE MBO PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1733
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo.permission_and_audit.rule
component: company-wide-mbo-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- company_wide_mbo_read
- company_wide_mbo_program_write
- company_wide_mbo_cascade_manage
- company_wide_mbo_assignment_manage
- company_wide_mbo_review_manage
- company_wide_mbo_export
- company_wide_mbo_audit_read
- company_wide_mbo_override

# RULE

Program write does not imply cascade manage.
Review manage does not imply subsystem override.
Read does not imply export.

