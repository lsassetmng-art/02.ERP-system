# ============================================================
# ERP PURCHASING VS INVENTORY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1465
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchasing_vs_inventory.boundary_rule
component: purchasing-vs-inventory-boundary-rule


# RULE

Purchasing core owns sourcing commitment and receipt expectation truth.

Inventory owns:
- stock-side interpretation
- stock record meaning
- reservation and adjustment meaning

# CONSEQUENCE

Purchasing may request inbound receipt expectation,
but inventory and warehouse layers determine stock-side realization meaning.

