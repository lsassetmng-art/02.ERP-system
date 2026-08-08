# ============================================================
# ERP MRP TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2589
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
- plan-run truth

Adjacent lines own:
- purchase = sourcing commitment truth
- manufacturing management = production execution truth
- inventory = stock truth
- sales = demand commitment truth

