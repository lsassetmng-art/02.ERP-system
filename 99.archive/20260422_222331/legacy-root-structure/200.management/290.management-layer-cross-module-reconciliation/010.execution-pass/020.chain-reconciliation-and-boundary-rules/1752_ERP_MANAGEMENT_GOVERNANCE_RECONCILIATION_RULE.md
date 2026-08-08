# ============================================================
# ERP MANAGEMENT GOVERNANCE RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1752
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_governance.reconciliation_rule
component: management-governance-reconciliation-rule


# RULE

Management core owns:
- review truth
- decision truth
- escalation truth
- directive truth

Governance and control owns:
- policy truth
- requirement truth
- exception truth
- override truth
- signoff truth

# CONSEQUENCE

The chain must preserve:
- management-created oversight truth
- governance-created control truth

No node in this chain may silently overwrite another node's truth.

