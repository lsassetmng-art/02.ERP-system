# ============================================================
# ERP PURCHASING WHOLE DESIGN EXECUTION POSITIONING
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1453
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchasing_whole_design_execution.positioning
component: purchasing-whole-design-execution-positioning


# POSITIONING

Purchasing core is the ERP sourcing commitment layer.

It owns:
- purchase request meaning
- purchase order truth
- supplier-facing sourcing commitment truth
- receipt expectation truth
- supplier return request truth

Purchasing core does not own:
- planning truth
- warehouse execution truth
- stock-side quantity truth
- journal and ledger truth

