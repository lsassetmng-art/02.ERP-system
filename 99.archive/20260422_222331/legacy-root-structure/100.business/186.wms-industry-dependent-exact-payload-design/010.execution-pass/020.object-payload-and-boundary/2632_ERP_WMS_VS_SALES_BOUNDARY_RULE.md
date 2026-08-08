# ============================================================
# ERP WMS VS SALES BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2632
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.wms_vs_sales.boundary_rule
component: wms-vs-sales-boundary-rule


# RULE

WMS owns:
- warehouse execution truth

Sales owns:
- fulfillment request truth
- commercial commitment truth

# CONSEQUENCE

A pick-pack wave is not sales-order truth.
A warehouse task may consume fulfillment references,
but it does not replace sales-owned truth.

