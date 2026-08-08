# ============================================================
# ERP MANUFACTURING VS INVENTORY PURCHASING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1502
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_vs_inventory_purchasing.boundary_rule
component: manufacturing-vs-inventory-purchasing-boundary-rule


# RULE

Purchasing owns inbound sourcing commitment truth.
Inventory owns stock-side interpretation truth.

Manufacturing owns:
- production execution truth
- material issue request meaning
- completion receipt meaning

# CONSEQUENCE

Manufacturing consumes purchasing and inventory context,
but does not replace purchasing or inventory truth ownership.

