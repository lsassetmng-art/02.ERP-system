# ============================================================
# ERP MANAGEMENT LABORMANAGER RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1753
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_labormanager.reconciliation_rule
component: management-labormanager-reconciliation-rule


# RULE

LaborManager owns:
- attendance truth
- leave truth
- lifecycle truth
- labor compliance-case truth

Management core owns:
- review truth
- decision truth
- escalation truth
- directive truth

# CONSEQUENCE

The chain must preserve:
- labor-created operation truth
- management-created oversight and directive truth

