# ============================================================
# ERP INVENTORY CORE VS WMS BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1390
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory_core_vs_wms.boundary_rule
component: inventory-core-vs-wms-boundary-rule


# RULE

WMS owns:
- physical warehouse execution
- receipt
- putaway
- pick
- movement
- count event execution
- discrepancy execution event

Inventory core owns:
- stock meaning
- reservation meaning
- transfer request meaning
- adjustment request meaning
- count reconciliation meaning

# CONSEQUENCE

WMS execution feeds inventory interpretation,
but does not replace inventory-core truth ownership.

