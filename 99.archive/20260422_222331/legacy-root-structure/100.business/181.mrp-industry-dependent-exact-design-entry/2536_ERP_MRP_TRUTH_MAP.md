# ============================================================
# ERP MRP TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2536
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.mrp.truth_map
component: mrp-truth-map


# MRP TRUTH MAP

MRP owns:
- requirement planning truth
- planned supply proposal truth
- shortage projection truth
- replenishment recommendation truth

Adjacent lines own:
- manufacturing management = production execution truth
- purchase = sourcing commitment truth
- inventory = stock truth

