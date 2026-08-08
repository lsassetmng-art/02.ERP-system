# ============================================================
# ERP MRP VS WMS BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-923
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_vs_wms.boundary_rule
component: mrp-vs-wms-boundary-rule


# MRP SIDE

MRP consumes inventory availability and stock signals
for planning interpretation.


# WMS SIDE

WMS should own:
- warehouse location truth
- receiving execution
- picking execution
- bin movement execution
- count and physical stock operation


# RULE

MRP must not overwrite warehouse execution truth.
WMS may provide stock-state inputs that MRP interprets
for planning, but WMS does not become BOM planning owner.

