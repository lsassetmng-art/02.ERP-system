# ============================================================
# ERP MPI INTEGRATED ANALYTICS AND REPORTING SURFACES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1064
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mpi.integrated_analytics_and_reporting_surfaces
component: mpi-integrated-analytics-and-reporting-surfaces


# PRIMARY SURFACES

- planning-to-execution lag surface
- warehouse feedback impact surface
- cross-module shortage visibility surface
- network disruption to warehouse impact surface
- unresolved exception aging surface
- family-wide continuity risk surface


# RULE

These are derived family-level reporting surfaces.

They must drill down to exact MRP, WMS, or SCM owned objects
when permissions allow.

