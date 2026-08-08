# ============================================================
# ERP MPI MODULE ROLE MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1042
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mpi.module_role_map
component: mpi-module-role-map


# ROLE MAP

MRP:
- demand interpretation
- BOM-driven planning
- requirement generation
- planned supply proposals

WMS:
- warehouse/location truth
- receipt/pick/movement/count execution
- discrepancy trace

SCM:
- network node and lane coordination
- replenishment and transfer coordination
- disruption and resilience interpretation


# RULE

Role-map overlap may exist in references,
but not in source-truth ownership.

