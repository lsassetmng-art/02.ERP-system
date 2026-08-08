# ============================================================
# ERP WMS VS INVENTORY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2631
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.wms_vs_inventory.boundary_rule
component: wms-vs-inventory-boundary-rule


# RULE

WMS owns:
- warehouse execution truth
- task and bin execution truth

Inventory owns:
- stock truth
- movement truth
- reservation truth

# CONSEQUENCE

A warehouse task is not stock ledger truth.
A bin allocation is not reservation ownership truth.
WMS may hand off execution visibility,
but it does not replace inventory-owned truth.

