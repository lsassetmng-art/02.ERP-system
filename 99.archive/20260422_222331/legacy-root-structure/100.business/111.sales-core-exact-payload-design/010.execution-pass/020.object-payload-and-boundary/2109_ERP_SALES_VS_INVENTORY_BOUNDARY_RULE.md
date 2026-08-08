# ============================================================
# ERP SALES VS INVENTORY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2109
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_vs_inventory.boundary_rule
component: sales-vs-inventory-boundary-rule


# RULE

Sales owns:
- commercial commitment truth
- fulfillment request truth

Inventory owns:
- stock truth
- movement truth
- reservation truth

# CONSEQUENCE

A fulfillment instruction is not a stock movement.
An order promise is not a reservation-owned truth.

