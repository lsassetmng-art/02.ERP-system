# ============================================================
# ERP WMS TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2543
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.wms.truth_map
component: wms-truth-map


# WMS TRUTH MAP

WMS owns:
- warehouse task truth
- bin execution truth
- wave execution truth
- receiving dock execution truth
- warehouse exception truth

Adjacent lines own:
- inventory = stock truth
- sales = fulfillment request truth
- purchase = receipt expectation truth

