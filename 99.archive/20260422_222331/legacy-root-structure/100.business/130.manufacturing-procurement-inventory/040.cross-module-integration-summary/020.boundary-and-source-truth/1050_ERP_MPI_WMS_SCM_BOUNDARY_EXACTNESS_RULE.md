# ============================================================
# ERP MPI WMS SCM BOUNDARY EXACTNESS RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1050
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mpi.wms_scm.boundary_exactness_rule
component: mpi-wms-scm-boundary-exactness-rule


# RULE

WMS owns:
- warehouse physical execution
- location truth
- lot and movement trace
- count/discrepancy execution

SCM owns:
- network-level supply continuity interpretation
- transfer coordination
- disruption visibility
- resilience interpretation


# CONSEQUENCE

SCM may use warehouse signals for network reasoning,
but SCM must not overwrite warehouse execution truth.

