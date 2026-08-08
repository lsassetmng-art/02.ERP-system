# ============================================================
# ERP INVENTORY VS SALES PURCHASING MANUFACTURING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1391
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory_vs_sales_purchasing_manufacturing.boundary_rule
component: inventory-vs-sales-purchasing-manufacturing-boundary-rule


# RULE

Sales owns commercial outbound demand truth.
Purchasing owns inbound sourcing commitment truth.
Manufacturing owns production consumption/output truth.

Inventory owns stock-side interpretation and reservation meaning.

# CONSEQUENCE

Business-side upstream and downstream modules create inventory context,
but do not replace inventory-core stock meaning.

