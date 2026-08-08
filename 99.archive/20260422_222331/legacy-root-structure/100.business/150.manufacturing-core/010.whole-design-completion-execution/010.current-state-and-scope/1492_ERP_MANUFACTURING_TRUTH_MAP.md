# ============================================================
# ERP MANUFACTURING TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1492
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing.truth_map
component: manufacturing-truth-map


# MANUFACTURING TRUTH MAP

Manufacturing core owns:
- production order truth
- operation execution meaning
- material issue request meaning
- completion receipt meaning
- scrap declaration meaning

Adjacent modules own:
- MRP = planning requirement truth
- SCM = network coordination truth
- purchasing = inbound sourcing commitment truth
- inventory = stock-side interpretation truth
- accounting = posting and ledger truth

