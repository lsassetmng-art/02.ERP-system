# ============================================================
# ERP ACCOUNTING VS SALES BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2205
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting_vs_sales.boundary_rule
component: accounting-vs-sales-boundary-rule


# RULE

Accounting owns:
- document draft truth
- journal truth
- receivable position truth

Sales owns:
- commercial commitment truth
- invoice request truth

# CONSEQUENCE

Invoice request is not journal truth.
Receivable position is not sales-owned commercial truth.

