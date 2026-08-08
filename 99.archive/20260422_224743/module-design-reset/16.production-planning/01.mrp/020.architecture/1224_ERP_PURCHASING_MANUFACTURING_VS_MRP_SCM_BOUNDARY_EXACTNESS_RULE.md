# ============================================================
# ERP PURCHASING MANUFACTURING VS MRP SCM BOUNDARY EXACTNESS RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1224
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.purchasing_manufacturing_vs_mrp_scm.boundary_exactness_rule
component: purchasing-manufacturing-vs-mrp-scm-boundary-exactness-rule


# RULE

Purchasing and manufacturing remain business-core modules.

MRP owns planning truth.
SCM owns network coordination truth.

# CONSEQUENCE

MRP and SCM may enrich business-core decision context,
but must not replace purchasing-core or manufacturing-core completion work.

