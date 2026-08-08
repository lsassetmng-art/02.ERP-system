# ============================================================
# ERP CRM OPTION AUDIT REFLECTION IN RESPONSE CONTRACT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-624
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.audit_reflection_in_response_contract
component: crm-option-audit-reflection-in-response-contract


# RULE

For audit-sensitive CRM option actions, responses should
reflect audit consequence explicitly.


# RECOMMENDED AUDIT REFLECTION FIELDS

- audit_action_code
- audit_required_flag
- audit_result_code
- audit_object_set
- audit_followup_required_flag


# REPRESENTATIVE AUDIT-SENSITIVE ACTIONS

- merge
- archive
- owner reassignment
- lifecycle reassignment
- inquiry closure override

