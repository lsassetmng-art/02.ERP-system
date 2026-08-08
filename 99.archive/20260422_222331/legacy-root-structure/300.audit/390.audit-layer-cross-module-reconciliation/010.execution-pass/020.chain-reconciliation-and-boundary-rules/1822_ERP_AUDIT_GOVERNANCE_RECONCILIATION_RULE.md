# ============================================================
# ERP AUDIT GOVERNANCE RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1822
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.audit_governance.reconciliation_rule
component: audit-governance-reconciliation-rule


# RULE

Governance and control owns:
- policy truth
- requirement truth
- exception truth
- override truth
- signoff truth

Audit core owns:
- evidence truth
- finding truth
- conclusion truth
- follow-up closure truth

# CONSEQUENCE

The chain must preserve:
- governance-created control truth
- audit-created assurance truth

No node in this chain may silently overwrite another node's truth.

