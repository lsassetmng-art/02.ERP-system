# ============================================================
# ERP SALES PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2123
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.permission_and_audit.rule
component: sales-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- sales_read
- sales_quote_write
- sales_order_manage
- sales_fulfillment_release
- sales_invoice_request_manage
- sales_correction_review
- sales_export
- sales_audit_read
- sales_override

# RULE

Order manage does not imply override.
Correction review does not imply export.
Read does not imply release.

