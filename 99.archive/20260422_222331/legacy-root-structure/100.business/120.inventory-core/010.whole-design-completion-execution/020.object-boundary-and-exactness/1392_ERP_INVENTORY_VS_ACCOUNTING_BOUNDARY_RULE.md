# ============================================================
# ERP INVENTORY VS ACCOUNTING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1392
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory_vs_accounting.boundary_rule
component: inventory-vs-accounting-boundary-rule


# RULE

Inventory core owns stock quantity and reconciliation meaning.

Accounting owns:
- valuation posting truth
- journal truth
- ledger truth
- correction and close-cycle truth

# CONSEQUENCE

Inventory adjustment or reconciliation may trigger accounting behavior,
but is not itself accounting posting truth.

