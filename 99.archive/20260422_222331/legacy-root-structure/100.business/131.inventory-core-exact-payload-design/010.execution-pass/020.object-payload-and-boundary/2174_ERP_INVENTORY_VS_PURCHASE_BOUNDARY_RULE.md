# ============================================================
# ERP INVENTORY VS PURCHASE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2174
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory_vs_purchase.boundary_rule
component: inventory-vs-purchase-boundary-rule


# RULE

Inventory owns:
- receipt truth
- stock truth
- movement truth

Purchase owns:
- sourcing commitment truth
- receipt expectation truth

# CONSEQUENCE

Receipt movement is not purchase order truth.
Available stock is not supplier commitment truth.

