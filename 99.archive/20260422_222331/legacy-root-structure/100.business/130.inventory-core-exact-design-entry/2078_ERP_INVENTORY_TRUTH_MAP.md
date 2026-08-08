# ============================================================
# ERP INVENTORY TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2078
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.truth_map
component: inventory-truth-map


# INVENTORY TRUTH MAP

Inventory owns:
- stock ledger truth
- movement truth
- reservation truth
- count adjustment truth

Adjacent lines own:
- sales = sales commitment truth
- purchase = sourcing truth
- accounting = posting truth

