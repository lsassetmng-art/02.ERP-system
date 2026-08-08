# ============================================================
# ERP MRP AUDIT SENSITIVE TRANSITION AND OVERRIDE RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-947
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.audit_sensitive_transition_and_override.rules
component: mrp-audit-sensitive-transition-and-override-rules


# REPRESENTATIVE AUDIT-SENSITIVE ACTIONS

- BOM activation with effective-date conflict override
- demand freeze release override
- run cancellation after execution
- planned order release despite critical exception
- recommendation acceptance despite supplier lead warning
- exception forced resolution closure


# RULE

These transitions require:
- exact actor
- exact timestamp
- justification
- previous state summary
- next state summary

When warning or unresolved shortage remains,
override path must remain visible rather than silently bypassed.

