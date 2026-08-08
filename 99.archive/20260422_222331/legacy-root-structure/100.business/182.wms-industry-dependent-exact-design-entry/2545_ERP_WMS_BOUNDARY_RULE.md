# ============================================================
# ERP WMS BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2545
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.wms.boundary_rule
component: wms-boundary-rule


# RULE

WMS owns:
- warehouse execution truth
- warehouse task truth

Inventory owns:
- stock truth

Sales owns:
- fulfillment request truth

Purchase owns:
- receipt expectation truth

# CONSEQUENCE

A warehouse task is not stock ledger truth.
A wave execution is not sales order truth.
WMS may execute against upstream references,
but it does not replace upstream-owned truths.

