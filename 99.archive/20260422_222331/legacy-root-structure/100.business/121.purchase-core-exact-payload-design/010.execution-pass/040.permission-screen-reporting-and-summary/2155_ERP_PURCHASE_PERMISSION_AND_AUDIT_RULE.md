# ============================================================
# ERP PURCHASE PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2155
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase.permission_and_audit.rule
component: purchase-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- purchase_read
- purchase_request_write
- purchase_order_manage
- purchase_receipt_release
- purchase_invoice_intake_manage
- purchase_correction_review
- purchase_export
- purchase_audit_read
- purchase_override

# RULE

Order manage does not imply override.
Correction review does not imply export.
Read does not imply release.

