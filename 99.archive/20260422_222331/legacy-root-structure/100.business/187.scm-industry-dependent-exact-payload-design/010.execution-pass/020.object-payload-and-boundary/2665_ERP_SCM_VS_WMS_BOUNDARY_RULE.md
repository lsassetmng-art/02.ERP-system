# ============================================================
# ERP SCM VS WMS BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2665
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.scm_vs_wms.boundary_rule
component: scm-vs-wms-boundary-rule


# RULE

SCM owns:
- transfer planning truth
- cross-node coordination truth

WMS owns:
- local warehouse execution truth
- warehouse task truth

# CONSEQUENCE

An inter-node transfer plan is not a warehouse task.
SCM may feed warehouse execution,
but it does not replace WMS-owned truth.

