# ============================================================
# ERP ACCOUNTING PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2220
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.permission_and_audit.rule
component: accounting-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- accounting_read
- accounting_document_manage
- journal_post
- receivable_payable_manage
- close_cycle_manage
- accounting_correction_review
- accounting_export
- accounting_audit_read
- accounting_override

# RULE

Journal post does not imply override.
Correction review does not imply export.
Read does not imply close-cycle manage.

