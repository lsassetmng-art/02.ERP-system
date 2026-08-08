# ============================================================
# ERP ACCOUNTING TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1418
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.truth_map
component: accounting-truth-map


# ACCOUNTING TRUTH MAP

Accounting core owns:
- journal truth
- ledger truth
- posting correction truth
- reversal truth
- close-cycle truth

Adjacent modules own:
- sales = billing instruction truth
- inventory = stock and adjustment meaning
- purchasing = sourcing commitment truth
- manufacturing = production consumption/output meaning
- management = summary and oversight interpretation

