# ============================================================
# ERP MPI SHARED REFERENCE AND LINKAGE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1051
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mpi.shared_reference_and_linkage_rule
component: mpi-shared-reference-and-linkage-rule


# RULE

Allowed shared reference families include:
- item reference
- site reference
- warehouse reference
- supplier reference
- node/lane reference
- originating plan/run/reference codes

Shared reference does not create shared ownership.

Cross-module linkage must preserve:
- upstream source object
- downstream consumer object
- linkage timestamp
- actor or system source where relevant

