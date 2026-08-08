# ============================================================
# ERP ACCOUNTING VS INVENTORY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2207
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting_vs_inventory.boundary_rule
component: accounting-vs-inventory-boundary-rule


# RULE

Accounting owns:
- valuation posting truth
- journal truth

Inventory owns:
- stock quantity truth
- movement truth
- adjustment truth

# CONSEQUENCE

Movement is not journal truth.
Valuation basis visibility is not inventory-owned accounting truth.

