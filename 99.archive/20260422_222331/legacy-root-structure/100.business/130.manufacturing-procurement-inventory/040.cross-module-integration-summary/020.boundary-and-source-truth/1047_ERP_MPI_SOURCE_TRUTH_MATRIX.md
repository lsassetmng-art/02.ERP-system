# ============================================================
# ERP MPI SOURCE TRUTH MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1047
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mpi.source_truth_matrix
component: mpi-source-truth-matrix


# SOURCE TRUTH MATRIX

MRP source truths:
- requirement run
- planned order
- purchase recommendation
- planning exception

WMS source truths:
- warehouse
- location
- inventory lot physical state
- receipt/pick/movement/count/discrepancy execution

SCM source truths:
- network node
- supply lane
- supply plan
- replenishment signal
- disruption event
- resilience assessment


# RULE

Cross-module drill-down may exist,
but summaries must never replace owned truths.

