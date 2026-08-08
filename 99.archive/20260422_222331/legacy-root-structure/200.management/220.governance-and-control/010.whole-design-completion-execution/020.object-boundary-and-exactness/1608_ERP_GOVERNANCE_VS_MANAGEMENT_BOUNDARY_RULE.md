# ============================================================
# ERP GOVERNANCE VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1608
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance_vs_management.boundary_rule
component: governance-vs-management-boundary-rule


# RULE

Management core owns:
- review cycle truth
- decision truth
- escalation truth
- directive truth

Governance/control owns:
- policy truth
- requirement truth
- exception truth
- override truth
- signoff truth

# CONSEQUENCE

Management may prioritize or direct governance work,
but it must not overwrite governance-owned control truth.

