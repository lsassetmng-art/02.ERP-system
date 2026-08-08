# ============================================================
# ERP SHIFTMANAGER AUDIT_SENSITIVE_ALLOCATION_TRANSITIONS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-819
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.audit_sensitive_allocation_transitions
component: shiftmanager-audit-sensitive-allocation-transitions


# REPRESENTATIVE AUDIT-SENSITIVE ACTIONS

- forced assignment override
- assignment despite labor constraint warning
- manager swap approval
- publication after unresolved gap
- locked roster reopen


# RULE

These transitions require:
- exact actor
- exact timestamp
- justification
- previous state summary
- next state summary

When constraint warnings remain unresolved,
override path must remain visible rather than silently bypassed.

