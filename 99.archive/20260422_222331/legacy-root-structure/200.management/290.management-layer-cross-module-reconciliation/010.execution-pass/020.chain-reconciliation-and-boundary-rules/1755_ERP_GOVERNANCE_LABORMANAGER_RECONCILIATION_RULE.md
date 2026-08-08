# ============================================================
# ERP GOVERNANCE LABORMANAGER RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1755
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance_labormanager.reconciliation_rule
component: governance-labormanager-reconciliation-rule


# RULE

Governance and control owns:
- policy truth
- requirement truth
- exception and override truth

LaborManager owns:
- labor operation truth
- compliance-case truth

# CONSEQUENCE

Labor-side events may trigger governance behavior,
but labor operation truth must remain distinguishable from governance control truth.

