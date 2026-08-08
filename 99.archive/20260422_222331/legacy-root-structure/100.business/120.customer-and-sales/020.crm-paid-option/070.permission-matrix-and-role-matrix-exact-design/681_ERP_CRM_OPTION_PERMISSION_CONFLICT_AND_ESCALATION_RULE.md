# ============================================================
# ERP CRM OPTION PERMISSION CONFLICT AND ESCALATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-681
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.permission_conflict_and_escalation_rule
component: crm-option-permission-conflict-and-escalation-rule


# PURPOSE

Defines how to interpret ambiguous or conflicting
permission situations.


# REPRESENTATIVE CONFLICTS

- actor can read inquiry but not reopen it
- actor can write account but not transition lifecycle
- actor can read interaction timeline but not view confidentiality-restricted entry
- actor can archive but option state blocks write
- actor has merge role but missing audit-read support


# RULE

Permission conflict must resolve to the narrower allowed path,
not the broader assumed path.


# ESCALATION CONSEQUENCE

When a blocked high-sensitivity action is business-relevant,
the UI/stateflow may surface escalation guidance such as:
- request higher-role support
- request merge reviewer
- request audit reviewer

