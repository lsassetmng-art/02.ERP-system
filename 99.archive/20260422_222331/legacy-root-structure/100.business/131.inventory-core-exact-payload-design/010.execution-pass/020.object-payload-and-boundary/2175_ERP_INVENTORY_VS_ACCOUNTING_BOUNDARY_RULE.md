# ============================================================
# ERP INVENTORY VS ACCOUNTING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2175
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory_vs_accounting.boundary_rule
component: inventory-vs-accounting-boundary-rule


# RULE

Inventory owns:
- stock quantity truth
- movement truth
- adjustment truth

Accounting owns:
- valuation posting truth
- journal truth

# CONSEQUENCE

A count adjustment is not journal truth.
Valuation basis visibility is not accounting-owned posting truth.

