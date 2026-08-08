# ============================================================
# ERP MPI WAREHOUSE FEEDBACK TO PLANNING RETURN CHAIN
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1056
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mpi.warehouse_feedback_to_planning.return_chain
component: mpi-warehouse-feedback-to-planning-return-chain


# RETURN CHAIN

WMS receipt / movement / count / discrepancy result
-> stock-state signal
-> MRP planning interpretation refresh
and/or
-> SCM network interpretation refresh


# RULE

Returned warehouse feedback must be explicit and traceable.
Feedback cannot silently mutate old planning truth without
new interpretation event or refreshed planning context.

