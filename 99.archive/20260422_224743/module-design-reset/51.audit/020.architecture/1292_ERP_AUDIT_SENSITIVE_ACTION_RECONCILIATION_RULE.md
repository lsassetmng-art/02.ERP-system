# ============================================================
# ERP AUDIT SENSITIVE ACTION RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1292
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.audit_sensitive_action.reconciliation_rule
component: audit-sensitive-action-reconciliation-rule


# RULE

Cross-layer audit-sensitive actions should preserve:
- exact actor
- exact timestamp
- previous state summary
- next state summary
- justification
- related object references where relevant

Override paths should remain more visible
than ordinary state transitions.

