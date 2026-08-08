# ============================================================
# ERP V3 RULE CONTROL TRUTH VS AUDIT TRUTH
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first draft rule
for control truth versus audit truth.

stable_rule_statement:
Control truth records what the system uses
to supervise, authorize, stop, restrict, or route behavior.
Audit truth records what the system preserves
to explain, review, prove, or inspect
what happened, what was decided, and why.

implications:
- control truth may influence behavior directly
- audit truth may explain behavior retrospectively
- control truth and audit truth may reference the same event
  without becoming the same architectural role
- post-event traceability must not absorb live control ownership

example_direction:
- system.runtime_killswitch, system.role_def,
  system.role_screen_permission, core.company_permission,
  and related control anchors remain control truth
- audit.approval_request, audit.approval_log, audit.audit_event,
  audit.exec_audit_event, and audit.ng_event remain audit truth
- control history views and audit evidence views must remain distinguishable

conclusion:
Control truth and audit truth must remain explicitly separated
even when they are tightly linked in workflows.
