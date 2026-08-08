# ============================================================
# ERP SALES TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2064
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.truth_map
component: sales-truth-map


# SALES TRUTH MAP

Sales owns:
- quote truth
- order truth
- fulfillment instruction truth
- invoice request truth

Adjacent lines own:
- inventory = stock and movement truth
- accounting = posting and receivable truth
- management = review and approval truth

