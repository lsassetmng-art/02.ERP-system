# ============================================================
# ERP MRP VS SALES BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2602
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.mrp_vs_sales.boundary_rule
component: mrp-vs-sales-boundary-rule


# RULE

MRP owns:
- demand planning interpretation truth
- replenishment response truth

Sales owns:
- commercial commitment truth
- sales demand source truth

# CONSEQUENCE

A demand requirement may consume sales references,
but it is not sales-owned commercial truth.
MRP may respond to sales demand,
but it does not replace sales-owned truth.

