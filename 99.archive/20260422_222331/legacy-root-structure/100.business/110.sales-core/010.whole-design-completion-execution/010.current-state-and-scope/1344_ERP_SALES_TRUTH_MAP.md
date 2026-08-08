# ============================================================
# ERP SALES TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1344
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.truth_map
component: sales-truth-map


# SALES TRUTH MAP

Sales core owns:
- quote commercial intent truth
- order commercial commitment truth
- billing instruction truth
- return request truth

Adjacent modules own:
- CRM and SFA = lead/opportunity/frontline activity truth
- inventory and WMS = stock and warehouse execution truth
- accounting = posting and ledger truth

