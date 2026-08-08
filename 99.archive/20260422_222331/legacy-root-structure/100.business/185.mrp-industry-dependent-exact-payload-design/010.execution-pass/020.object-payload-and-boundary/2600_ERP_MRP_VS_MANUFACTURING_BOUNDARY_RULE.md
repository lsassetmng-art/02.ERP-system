# ============================================================
# ERP MRP VS MANUFACTURING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2600
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.mrp_vs_manufacturing.boundary_rule
component: mrp-vs-manufacturing-boundary-rule


# RULE

MRP owns:
- requirement planning truth
- planned supply proposal truth

Manufacturing management owns:
- production execution truth
- completion truth

# CONSEQUENCE

A planned supply order is not a production execution case.
A plan run is not shop-floor execution truth.
MRP may drive manufacturing visibility,
but it does not replace manufacturing-owned truth.

