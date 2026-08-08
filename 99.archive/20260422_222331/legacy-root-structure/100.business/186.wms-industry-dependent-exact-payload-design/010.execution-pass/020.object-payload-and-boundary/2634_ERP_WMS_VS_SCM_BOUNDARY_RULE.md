# ============================================================
# ERP WMS VS SCM BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2634
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.wms_vs_scm.boundary_rule
component: wms-vs-scm-boundary-rule


# RULE

WMS owns:
- warehouse execution truth
- local warehouse exception truth

SCM owns:
- network coordination truth
- transfer planning truth
- supply risk truth

# CONSEQUENCE

A warehouse exception is not cross-node coordination truth.
A warehouse task may consume transfer references,
but it does not replace SCM-owned truth.

