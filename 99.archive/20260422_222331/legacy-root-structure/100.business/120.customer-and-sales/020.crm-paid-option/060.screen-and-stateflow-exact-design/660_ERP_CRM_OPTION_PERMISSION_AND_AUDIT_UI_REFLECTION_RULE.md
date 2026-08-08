# ============================================================
# ERP CRM OPTION PERMISSION AND AUDIT UI REFLECTION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-660
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.permission_and_audit_ui_reflection.rule
component: crm-option-permission-and-audit-ui-reflection-rule


# PERMISSION UI RULE

Unavailable actions should preferably appear as:
- hidden when irrelevant
or
- disabled with clear reason when explainability matters


# AUDIT UI RULE

Audit-sensitive actions should communicate:
- action consequence
- reason requirement
- confirmation requirement
- possible follow-up review implication


# REPRESENTATIVE AUDIT-SENSITIVE UI ACTIONS

- merge
- archive
- unarchive
- owner reassignment
- lifecycle controlled transition
- inquiry reopen
- inquiry closure override

