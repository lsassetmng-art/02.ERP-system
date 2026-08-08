# ============================================================
# ERP WMS VS MRP BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-962
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_vs_mrp.boundary_rule
component: wms-vs-mrp-boundary-rule


# WMS SIDE

WMS owns:
- warehouse location truth
- receipt execution
- putaway execution
- pick execution
- movement execution
- count execution
- discrepancy execution trace


# MRP SIDE

MRP owns:
- demand interpretation
- BOM-driven requirement planning
- requirement runs
- planned orders
- purchase recommendations
- planning exceptions


# RULE

WMS may feed stock-state signals to MRP.
WMS does not replace MRP as planning owner.

