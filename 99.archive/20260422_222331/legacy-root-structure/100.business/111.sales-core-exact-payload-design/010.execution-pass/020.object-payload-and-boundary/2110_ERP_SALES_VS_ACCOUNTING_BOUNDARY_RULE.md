# ============================================================
# ERP SALES VS ACCOUNTING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2110
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_vs_accounting.boundary_rule
component: sales-vs-accounting-boundary-rule


# RULE

Sales owns:
- invoice request truth

Accounting owns:
- accounting document truth
- journal truth
- receivable position truth

# CONSEQUENCE

Invoice request is not posting truth.
Accounting handoff state is not accounting-owned journal truth.

