# ============================================================
# ERP GOVERNANCE VS BUSINESS LABOR BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1609
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance_vs_business_labor.boundary_rule
component: governance-vs-business-labor-boundary-rule


# RULE

Business core owns operational business truth.
LaborManager owns labor operation truth.

Governance/control owns:
- control policy truth
- control requirement truth
- exception and override truth
- signoff truth

# CONSEQUENCE

Business and labor events may trigger governance behavior,
but they do not replace governance-owned control truth.

