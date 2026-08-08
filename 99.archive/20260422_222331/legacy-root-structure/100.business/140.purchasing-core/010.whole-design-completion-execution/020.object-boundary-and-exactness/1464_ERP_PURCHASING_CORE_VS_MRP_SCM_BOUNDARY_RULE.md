# ============================================================
# ERP PURCHASING CORE VS MRP SCM BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1464
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchasing_core_vs_mrp_scm.boundary_rule
component: purchasing-core-vs-mrp-scm-boundary-rule


# RULE

MRP owns:
- planning requirement truth
- planned supply proposal truth

SCM owns:
- network coordination truth
- source and lane context truth

Purchasing core owns:
- purchase request
- purchase order
- supplier-facing sourcing commitment

# CONSEQUENCE

MRP and SCM may feed purchasing context,
but do not replace purchasing-core sourcing commitment truth.

