# ============================================================
# ERP AUDIT DESIGN NEXT ACTIONS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Lists the immediate next actions for audit design expansion.

immediate_next_actions:
1. identify the audit-core object set
2. compare audit.approval_request and audit.approval_log roles
3. inspect entity_status_history as audit-linked or shared-history layer
4. inspect exec_audit_event and audit_event families
5. inspect integration audit-export queue / SIEM queue relationship
6. produce first audit object classification summary

expected_outputs:
- audit object inventory
- audit role classification
- audit truth/history/evidence/export split
- audit architecture first-pass summary

conclusion:
The next audit step should be inventory and role-classification first.
