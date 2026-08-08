# ============================================================
# ERP PURCHASE VS INVENTORY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2141
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase_vs_inventory.boundary_rule
component: purchase-vs-inventory-boundary-rule


# RULE

Purchase owns:
- sourcing commitment truth
- receipt expectation truth

Inventory owns:
- receipt truth
- stock truth
- movement truth

# CONSEQUENCE

A receipt expectation is not a receipt movement.
A promised receipt date is not inventory-owned stock truth.

