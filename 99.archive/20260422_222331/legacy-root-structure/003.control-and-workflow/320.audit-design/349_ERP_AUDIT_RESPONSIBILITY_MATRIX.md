# ============================================================
# ERP AUDIT RESPONSIBILITY MATRIX
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass responsibility matrix
for audit-related objects.

responsibility_matrix:

  audit.approval_request:
    responsibility:
    - approval lifecycle truth
    - approval decision state
    - approval policy-linked evidence

  audit.approval_log:
    responsibility:
    - action log
    - decision record trail
    - approver activity trace

  audit.audit_event:
    responsibility:
    - generic business audit events
    - reason_code-based audit event truth

  audit.exec_audit_event:
    responsibility:
    - execution-side audit evidence
    - runtime-linked event trace

  audit.entity_status_history:
    responsibility:
    - status change history
    - entity transition trace

  audit.ng_event:
    responsibility:
    - anomaly recording
    - severity and quarantine evidence

  integration.audit_export_queue:
    responsibility:
    - outbound audit export orchestration

  integration.siem_delivery_queue:
    responsibility:
    - SIEM delivery orchestration

  core.fn_audit_trail():
    responsibility:
    - cross-cutting audit trail generation

  core.trg_audit_iud():
    responsibility:
    - mutation capture trigger layer

conclusion:
Audit responsibilities are layered across truth, history, evidence,
delivery boundary, and infrastructure support.
