# ============================================================
# ERP MANUFACTURING WHOLE DESIGN EXECUTION POSITIONING
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1490
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_whole_design_execution.positioning
component: manufacturing-whole-design-execution-positioning


# POSITIONING

Manufacturing core is the ERP production execution meaning layer.

It owns:
- production order truth
- production operation execution truth
- material issue request meaning
- production completion receipt meaning
- scrap declaration meaning

Manufacturing core does not own:
- planning requirement truth
- network coordination truth
- stock-side quantity truth
- journal and ledger truth
- external supplier sourcing commitment truth

