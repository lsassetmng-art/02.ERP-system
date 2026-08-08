# ============================================================
# ERP SALES VS INVENTORY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1354
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_vs_inventory.boundary_rule
component: sales-vs-inventory-boundary-rule


# RULE

Sales core owns commercial order and fulfillment instruction truth.

Inventory owns:
- stock interpretation
- allocation and reservation meaning
- inventory balance meaning

# CONSEQUENCE

Sales may request fulfillment,
but inventory and warehouse layers determine stock-side execution meaning.

