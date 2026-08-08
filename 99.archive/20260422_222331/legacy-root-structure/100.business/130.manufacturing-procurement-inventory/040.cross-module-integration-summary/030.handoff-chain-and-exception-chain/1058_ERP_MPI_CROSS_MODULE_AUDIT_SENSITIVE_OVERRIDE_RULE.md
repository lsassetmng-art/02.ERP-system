# ============================================================
# ERP MPI CROSS MODULE AUDIT SENSITIVE OVERRIDE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1058
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mpi.cross_module.audit_sensitive_override_rule
component: mpi-cross-module-audit-sensitive-override-rule


# RULE

Cross-module overrides require:
- exact originating condition
- exact receiving module
- exact actor
- exact timestamp
- explicit justification
- previous state summary
- next state summary

Representative cases:
- MRP proposal accepted despite WMS constraint
- SCM transfer decision despite active disruption
- WMS closure despite upstream unresolved planning concern

