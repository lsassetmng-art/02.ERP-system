# ============================================================
# ERP ACCOUNTING WHOLE DESIGN EXECUTION POSITIONING
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1416
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting_whole_design_execution.positioning
component: accounting-whole-design-execution-positioning


# POSITIONING

Accounting core is the ERP financial posting
and closing truth layer.

It owns:
- journal entry truth
- ledger truth
- subledger linkage meaning
- posting correction meaning
- close-cycle meaning

Accounting core does not own:
- commercial order truth
- stock-side operational truth
- warehouse execution truth
- production execution truth

