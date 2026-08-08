# ============================================================
# ERP AUDIT VS GOVERNANCE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1789
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.audit_vs_governance.boundary_rule
component: audit-vs-governance-boundary-rule


# RULE

Governance/control owns:
- policy truth
- requirement truth
- exception truth
- override truth
- signoff truth

Audit core owns:
- engagement truth
- evidence truth
- finding truth
- conclusion truth
- follow-up closure truth

# CONSEQUENCE

Governance visibility may feed audit work,
but it does not replace audit-owned assurance truth.

