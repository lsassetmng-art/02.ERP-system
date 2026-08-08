# ============================================================
# ERP AUDIT SENSITIVE ACTION BASELINE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1195
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.audit_sensitive_action.baseline
component: audit-sensitive-action-baseline


# BASELINE

Representative audit-sensitive actions should preserve:
- exact actor
- exact timestamp
- previous state summary
- next state summary
- justification
- related object references where relevant

# RULE

Override-class actions must remain more visible
than ordinary state changes.

