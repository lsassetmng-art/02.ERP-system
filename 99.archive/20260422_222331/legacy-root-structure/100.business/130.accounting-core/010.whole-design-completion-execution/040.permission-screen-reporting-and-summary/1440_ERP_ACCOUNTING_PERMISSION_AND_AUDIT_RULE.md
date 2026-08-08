# ============================================================
# ERP ACCOUNTING PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1440
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.permission_and_audit.rule
component: accounting-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- accounting_read
- accounting_journal_write
- accounting_correction_review
- accounting_close_approve
- accounting_export
- accounting_audit_read
- accounting_override

# RULE

Journal write does not imply close approve.
Correction review does not imply override.
Read does not imply export.

