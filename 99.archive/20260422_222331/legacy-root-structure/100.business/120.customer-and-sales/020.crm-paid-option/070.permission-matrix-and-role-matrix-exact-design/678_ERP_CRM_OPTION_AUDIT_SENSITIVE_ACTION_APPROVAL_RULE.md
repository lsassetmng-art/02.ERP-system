# ============================================================
# ERP CRM OPTION AUDIT SENSITIVE ACTION APPROVAL RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-678
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.audit_sensitive_action_approval_rule
component: crm-option-audit-sensitive-action-approval-rule


# REPRESENTATIVE AUDIT-SENSITIVE ACTIONS

- merge
- unarchive
- owner reassignment
- lifecycle controlled transition
- inquiry reopen
- inquiry closure override


# RULE

Some tenant policies may require not only permission
but also explicit confirmation or approval-style
secondary acknowledgement.

This set does not force a universal second approver,
but preserves the design room for:

- confirmation_required
- review_required
- audit_followup_required


# CONSEQUENCE

Permission grant alone may not complete the action path.

