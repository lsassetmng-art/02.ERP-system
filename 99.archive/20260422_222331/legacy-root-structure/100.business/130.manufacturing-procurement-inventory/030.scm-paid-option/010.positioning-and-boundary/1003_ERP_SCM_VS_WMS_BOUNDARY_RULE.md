# ============================================================
# ERP SCM VS WMS BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1003
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_vs_wms.boundary_rule
component: scm-vs-wms-boundary-rule


# SCM SIDE

SCM owns network-wide supply coordination and disruption visibility.


# WMS SIDE

WMS owns:
- warehouse location truth
- receipt execution
- putaway execution
- pick execution
- stock movement execution
- count and discrepancy execution


# RULE

SCM may consume warehouse execution signals for
network interpretation.

SCM must not overwrite WMS physical execution truth.

