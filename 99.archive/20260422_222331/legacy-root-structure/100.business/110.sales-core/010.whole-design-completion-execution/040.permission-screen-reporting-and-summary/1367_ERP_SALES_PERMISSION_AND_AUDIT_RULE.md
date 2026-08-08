# ============================================================
# ERP SALES PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1367
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.permission_and_audit.rule
component: sales-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- sales_read
- sales_quote_write
- sales_order_write
- sales_billing_release
- sales_return_review
- sales_export
- sales_audit_read
- sales_override

# RULE

Quote write does not imply billing release.
Billing release does not imply override.
Read does not imply export.

