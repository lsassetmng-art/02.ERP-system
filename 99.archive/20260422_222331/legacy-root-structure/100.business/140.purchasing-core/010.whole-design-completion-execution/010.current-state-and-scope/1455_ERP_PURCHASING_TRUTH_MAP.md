# ============================================================
# ERP PURCHASING TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1455
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchasing.truth_map
component: purchasing-truth-map


# PURCHASING TRUTH MAP

Purchasing core owns:
- purchase request intent meaning
- purchase order sourcing commitment truth
- supplier receipt expectation truth
- supplier return request truth

Adjacent modules own:
- MRP = planning requirement truth
- SCM = network coordination truth
- inventory = stock-side interpretation truth
- WMS = warehouse execution truth
- accounting = posting and ledger truth
- manufacturing = production need meaning

