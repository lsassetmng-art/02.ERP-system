# ============================================================
# ERP WMS VS PURCHASE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2633
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.wms_vs_purchase.boundary_rule
component: wms-vs-purchase-boundary-rule


# RULE

WMS owns:
- receiving execution truth
- warehouse task truth

Purchase owns:
- receipt expectation truth
- sourcing commitment truth

# CONSEQUENCE

A dock execution is not purchase-order truth.
Receiving execution may consume purchase references,
but it does not replace purchase-owned truth.

