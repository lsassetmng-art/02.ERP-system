# ============================================================
# ERP CROSS OPTION AUDIT SENSITIVE OVERRIDE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1092
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.cross_option.audit_sensitive_override_rule
component: cross-option-audit-sensitive-override-rule


# RULE

Cross-option overrides require:
- exact originating condition
- exact receiving option
- exact actor
- exact timestamp
- explicit justification
- previous state summary
- next state summary

Representative cases:
- management approval despite unresolved operational concern
- option-level activation despite blocked dependency
- summary closure despite module-level unresolved exception

