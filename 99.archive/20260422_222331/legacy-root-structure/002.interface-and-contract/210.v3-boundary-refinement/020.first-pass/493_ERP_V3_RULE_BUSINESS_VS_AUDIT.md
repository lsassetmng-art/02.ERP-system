# ============================================================
# ERP V3 RULE BUSINESS VS AUDIT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first draft rule
for business versus audit boundary handling.

stable_rule_statement:
Business owns transaction truth, document-chain truth,
execution progression, and business-state truth.
Audit owns evidence interpretation, approval history,
exception traceability, audit-event recording,
and audit-facing control review.

implications:
- audit-facing evidence must not replace business transaction ownership
- business objects remain the source of operational occurrence
- audit objects remain the source of traceability,
  review history, and evidence interpretation
- derived audit summaries must not be confused with business execution truth

example_direction:
- sales, purchase, inventory, and manufacturing anchors remain business-owned
- audit.approval_request, audit.approval_log, audit.audit_event,
  audit.exec_audit_event, and audit.ng_event remain audit-owned
- joins across them do not collapse ownership into one side

conclusion:
Business and audit must be separated by
operational occurrence truth versus evidence-and-review responsibility.
