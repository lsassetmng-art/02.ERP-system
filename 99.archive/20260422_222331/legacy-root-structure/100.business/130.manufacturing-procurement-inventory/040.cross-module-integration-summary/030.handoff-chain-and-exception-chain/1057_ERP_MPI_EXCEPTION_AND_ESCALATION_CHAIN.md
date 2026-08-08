# ============================================================
# ERP MPI EXCEPTION AND ESCALATION CHAIN
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1057
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mpi.exception_and_escalation.chain
component: mpi-exception-and-escalation-chain


# REPRESENTATIVE CHAIN

MRP shortage or planning exception
-> SCM evaluates cross-node alternative or disruption context
-> WMS execution constraint may confirm or worsen the condition
-> escalation to planner / network reviewer / warehouse reviewer
-> visible decision and follow-up action


# RULE

Exception travel across modules must keep:
- originating module
- original exception type
- current escalation owner
- final resolution module

