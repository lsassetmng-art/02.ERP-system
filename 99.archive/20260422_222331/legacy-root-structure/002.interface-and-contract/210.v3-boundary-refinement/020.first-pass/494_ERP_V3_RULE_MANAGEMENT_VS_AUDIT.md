# ============================================================
# ERP V3 RULE MANAGEMENT VS AUDIT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first draft rule
for management versus audit boundary handling.

stable_rule_statement:
Management owns supervision, authorization structure,
role/permission control, intervention capability,
and oversight responsibility.
Audit owns evidence retention, review traceability,
exception/event recording, and audit-side interpretation
of controlled actions and outcomes.

implications:
- management control layers must not be reclassified as audit truth
- audit records about management actions remain audit-owned evidence
- analytical or operational summaries over management activity
  do not transfer intervention ownership away from management
- approval support and audit history must remain distinct

example_direction:
- system.role_def, system.runtime_killswitch,
  core.company_permission, core.permission_groups,
  core.user_permissions, and system.operation_log remain management-side anchors
- audit.approval_log, audit.audit_event, audit.exec_audit_event,
  and audit.ng_event remain audit-side anchors
- management intervention and audit evidence about that intervention
  must remain separable

conclusion:
Management and audit must be separated by
oversight/intervention ownership versus evidence-and-review responsibility.
