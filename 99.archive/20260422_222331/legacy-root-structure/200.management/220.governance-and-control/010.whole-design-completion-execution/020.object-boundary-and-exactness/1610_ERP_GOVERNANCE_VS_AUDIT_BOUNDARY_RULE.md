# ============================================================
# ERP GOVERNANCE VS AUDIT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1610
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance_vs_audit.boundary_rule
component: governance-vs-audit-boundary-rule


# RULE

Governance/control owns:
- policy truth
- requirement truth
- exception truth
- override truth
- signoff truth

Audit owns:
- audit conclusion truth
- audit opinion truth
- audit finding closure truth

# CONSEQUENCE

Governance visibility may feed audit work,
but it does not replace audit-owned conclusion truth.

