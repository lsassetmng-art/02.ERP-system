# ============================================================
# ERP MANUFACTURING CORE VS MRP SCM BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1501
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_core_vs_mrp_scm.boundary_rule
component: manufacturing-core-vs-mrp-scm-boundary-rule


# RULE

MRP owns:
- planning requirement truth
- planned production proposal truth

SCM owns:
- network coordination truth
- supply continuity context truth

Manufacturing core owns:
- production order
- production operation
- material issue request
- completion receipt
- scrap declaration

# CONSEQUENCE

MRP and SCM may feed manufacturing context,
but do not replace manufacturing-core execution truth.

