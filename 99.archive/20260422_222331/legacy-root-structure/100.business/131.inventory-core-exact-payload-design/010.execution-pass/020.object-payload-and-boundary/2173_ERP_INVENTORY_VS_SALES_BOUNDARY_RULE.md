# ============================================================
# ERP INVENTORY VS SALES BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2173
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory_vs_sales.boundary_rule
component: inventory-vs-sales-boundary-rule


# RULE

Inventory owns:
- stock truth
- movement truth
- reservation truth

Sales owns:
- commercial commitment truth
- fulfillment request truth

# CONSEQUENCE

Reservation is not order truth.
Shipment movement is not sales-owned commitment truth.

