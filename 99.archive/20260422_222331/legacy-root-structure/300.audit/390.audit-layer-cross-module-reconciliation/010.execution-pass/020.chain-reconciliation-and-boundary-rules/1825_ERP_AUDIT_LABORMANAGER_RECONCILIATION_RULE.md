# ============================================================
# ERP AUDIT LABORMANAGER RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1825
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.audit_labormanager.reconciliation_rule
component: audit-labormanager-reconciliation-rule


# RULE

LaborManager owns:
- attendance truth
- leave truth
- lifecycle truth
- labor compliance-case truth

Audit core owns:
- evidence truth
- finding truth
- conclusion truth
- closure truth

# CONSEQUENCE

Labor-side events may feed audit work,
but labor truth must remain distinguishable from audit assurance truth.

