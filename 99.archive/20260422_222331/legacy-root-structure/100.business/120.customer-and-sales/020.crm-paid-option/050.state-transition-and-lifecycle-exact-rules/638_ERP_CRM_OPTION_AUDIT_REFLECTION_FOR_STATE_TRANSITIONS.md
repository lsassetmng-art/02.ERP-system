# ============================================================
# ERP CRM OPTION AUDIT REFLECTION FOR STATE TRANSITIONS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-638
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.audit_reflection_for_state_transitions
component: crm-option-audit-reflection-for-state-transitions


# RULE

State transitions with governance significance must
produce explicit audit reflection.


# MINIMUM AUDIT REFLECTION SET

- audit_action_code
- target_object_id
- target_object_type
- previous_state_summary
- next_state_summary
- action_at
- action_by
- justification_code
- justification_note
- audit_result_code


# HIGH-SENSITIVITY TRANSITIONS

- merge
- archive
- unarchive
- owner reassignment
- lifecycle reassignment
- inquiry reopen
- inquiry closure override

