# ============================================================
# ERP PURCHASING PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1478
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchasing.permission_and_audit.rule
component: purchasing-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- purchasing_read
- purchase_request_write
- purchase_order_write
- purchase_order_approve
- supplier_return_review
- purchasing_export
- purchasing_audit_read
- purchasing_override

# RULE

Purchase request write does not imply purchase order approve.
Purchase order approve does not imply override.
Read does not imply export.

