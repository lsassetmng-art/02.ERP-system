# ============================================================
# ERP WMS VS SCM BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-963
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_vs_scm.boundary_rule
component: wms-vs-scm-boundary-rule


# WMS SIDE

WMS owns physical warehouse execution and internal stock location truth.


# SCM SIDE

SCM should own:
- broader supply network planning
- external supply chain coordination
- supplier and lane orchestration
- broader risk and resilience views


# RULE

WMS may expose execution status to SCM,
but does not replace SCM as the external network layer.

