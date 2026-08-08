# ============================================================
# ERP EPM AUDIT SENSITIVE TRANSITION AND EXCEPTION RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-859
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.audit_sensitive_transition_and_exception.rules
component: epm-audit-sensitive-transition-and-exception-rules


# REPRESENTATIVE AUDIT-SENSITIVE ACTIONS

- objective cancellation after activation
- locked plan reopen
- review cycle override close
- KPI retirement override
- forecast lock override
- variance explanation closure without required basis


# RULE

These transitions require:
- exact actor
- exact timestamp
- justification
- previous state summary
- next state summary

When review or basis remains unresolved,
override path must remain visible rather than silently bypassed.

