# ============================================================
# ERP RECOVERY VS SOURCE OWNERSHIP BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2853
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.recovery_vs_source_ownership.boundary_rule
component: recovery-vs-source-ownership-boundary-rule


# RULE

Recovery surfaces may reference source truth,
but they do not mutate source-family canonical completion semantics
outside source-approved contracts.

# CONSEQUENCE

A retry entry is not source truth.
A replay audit entry is not source rollback truth.

