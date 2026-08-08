# ============================================================
# ERP CRM OPTION AUTHORITY AND AUDIT EXACTNESS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-604
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.authority_and_audit_exactness
component: crm-option-authority-and-audit-exactness


# AUTHORITY EXACTNESS

Representative exact authority-sensitive actions:

- account merge
- contact merge
- owner reassignment
- archive / unarchive
- lifecycle reassignment
- segment reassignment
- inquiry reassignment
- inquiry closure override


# AUDIT EXACTNESS

For authority-sensitive actions, exact audit context
should preserve at minimum:

- target_object_id
- target_object_type
- action_code
- action_at
- action_by
- previous_state_summary
- next_state_summary
- justification_code
- justification_note


# INTERPRETATION RULE

CRM option may be optional commercially,
but when enabled it must still be governance-grade.

