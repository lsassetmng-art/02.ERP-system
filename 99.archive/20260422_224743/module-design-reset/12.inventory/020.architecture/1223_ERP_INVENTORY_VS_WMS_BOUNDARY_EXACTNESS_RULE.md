# ============================================================
# ERP INVENTORY VS WMS BOUNDARY EXACTNESS RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1223
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.inventory_vs_wms.boundary_exactness_rule
component: inventory-vs-wms-boundary-exactness-rule


# RULE

Inventory core owns business-layer inventory interpretation and business meaning.

WMS owns warehouse execution truth:
- location
- receipt
- pick
- movement
- count
- discrepancy execution

# CONSEQUENCE

Inventory must not be collapsed into WMS execution truth,
and WMS progress must not be used as proof that inventory core is complete.

