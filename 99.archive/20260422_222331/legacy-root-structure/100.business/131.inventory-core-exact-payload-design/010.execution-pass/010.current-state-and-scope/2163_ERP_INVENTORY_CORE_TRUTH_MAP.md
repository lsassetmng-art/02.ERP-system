# ============================================================
# ERP INVENTORY CORE TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2163
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory_core.truth_map
component: inventory-core-truth-map


# INVENTORY CORE TRUTH MAP

Inventory owns:
- stock ledger truth
- movement truth
- reservation truth
- count adjustment truth
- replenishment signal truth

Adjacent lines own:
- sales = commitment and fulfillment request truth
- purchase = sourcing and receipt expectation truth
- accounting = posting and valuation journal truth

