# ============================================================
# ERP MPI MRP SCM BOUNDARY EXACTNESS RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1049
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mpi.mrp_scm.boundary_exactness_rule
component: mpi-mrp-scm-boundary-exactness-rule


# RULE

MRP owns:
- BOM-driven planning
- requirement generation
- planned supply outputs

SCM owns:
- wider network coordination
- source and lane choice context
- disruption and resilience context
- replenishment and transfer orchestration


# CONSEQUENCE

SCM may contextualize MRP outputs across the network,
but must not replace MRP as requirement truth owner.

