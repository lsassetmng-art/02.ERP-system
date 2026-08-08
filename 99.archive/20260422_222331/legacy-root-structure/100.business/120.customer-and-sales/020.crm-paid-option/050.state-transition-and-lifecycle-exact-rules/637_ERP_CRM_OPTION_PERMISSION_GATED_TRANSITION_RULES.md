# ============================================================
# ERP CRM OPTION PERMISSION GATED TRANSITION RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-637
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.permission_gated_transition.rules
component: crm-option-permission-gated-transition-rules


# PURPOSE

Defines which transition families should be treated
as permission-gated rather than ordinary edits.


# PERMISSION-GATED TRANSITIONS

- merge
- archive
- unarchive
- owner reassignment
- lifecycle reassignment
- inquiry reopen from closed
- inquiry closure override
- blocked_for_review release
- duplicate resolution


# RULE

A client with ordinary edit permission must not
implicitly receive transition authority for the above.


# CONSEQUENCE

Permission failure must return explicit contract error,
not silent no-op or hidden downgrade.

