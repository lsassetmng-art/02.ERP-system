# ============================================================
# ERP INVENTORY TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1381
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.truth_map
component: inventory-truth-map


# INVENTORY TRUTH MAP

Inventory core owns:
- stock meaning by item and inventory location interpretation
- reservation and allocation meaning
- transfer request meaning
- count reconciliation meaning
- adjustment request meaning

Adjacent modules own:
- WMS = warehouse execution truth
- sales = commercial demand and fulfillment request truth
- purchasing = inbound sourcing commitment truth
- manufacturing = production consumption/output truth
- accounting = valuation posting and ledger truth

