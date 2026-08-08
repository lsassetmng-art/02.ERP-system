# ============================================================
# ERP THRESHOLD DECAY AUTOMATION PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3313
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.threshold_decay_automation.permission_and_audit.rule
component: threshold-decay-automation-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- threshold_decay_automation_read
- threshold_tuning_manage
- trust_decay_manage
- audit_escalation_automation_manage
- escalation_summary_manage
- threshold_decay_automation_export
- threshold_decay_automation_audit_read
- threshold_decay_automation_override

# RULE

Audit escalation automation manage does not imply override.
Escalation summary manage does not imply export.
Read does not imply trust decay manage.

