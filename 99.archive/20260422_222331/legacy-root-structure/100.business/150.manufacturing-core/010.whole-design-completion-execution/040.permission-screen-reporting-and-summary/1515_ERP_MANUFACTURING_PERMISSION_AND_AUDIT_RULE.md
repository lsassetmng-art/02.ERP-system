# ============================================================
# ERP MANUFACTURING PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1515
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing.permission_and_audit.rule
component: manufacturing-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- manufacturing_read
- production_order_write
- production_order_release
- material_issue_release
- completion_receipt_review
- manufacturing_export
- manufacturing_audit_read
- manufacturing_override

# RULE

Production order write does not imply production order release.
Completion receipt review does not imply override.
Read does not imply export.

