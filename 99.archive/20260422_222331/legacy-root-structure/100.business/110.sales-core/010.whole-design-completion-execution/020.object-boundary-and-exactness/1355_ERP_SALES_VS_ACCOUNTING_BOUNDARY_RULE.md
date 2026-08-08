# ============================================================
# ERP SALES VS ACCOUNTING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1355
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_vs_accounting.boundary_rule
component: sales-vs-accounting-boundary-rule


# RULE

Sales core owns commercial billing instruction truth.

Accounting owns:
- journal truth
- ledger truth
- posting correction truth
- close-cycle truth

# CONSEQUENCE

Sales billing instruction may trigger accounting behavior,
but it is not itself accounting posting truth.

