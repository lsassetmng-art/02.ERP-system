# ============================================================
# ERP MPI MRP WMS BOUNDARY EXACTNESS RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1048
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mpi.mrp_wms.boundary_exactness_rule
component: mpi-mrp-wms-boundary-exactness-rule


# RULE

MRP owns:
- material need timing
- planning proposals
- shortage planning interpretation

WMS owns:
- physical stock placement
- receipt/pick/movement/count execution
- discrepancy execution outcome


# CONSEQUENCE

MRP may infer shortage using WMS-fed stock state,
but must not overwrite WMS execution truth.

WMS may expose execution feedback,
but must not create MRP planning truth.

