# ============================================================
# ERP SALES WHOLE DESIGN EXECUTION POSITIONING
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1342
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_whole_design_execution.positioning
component: sales-whole-design-execution-positioning


# POSITIONING

Sales core is the ERP commercial commitment layer.

It owns:
- quote truth
- order truth
- billing instruction truth
- return request truth
- sales-side commercial state interpretation

Sales core does not own:
- lead and opportunity activity truth
- warehouse execution truth
- journal and ledger truth

