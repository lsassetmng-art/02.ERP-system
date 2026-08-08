# ============================================================
# ERP AUDIT OBJECT ROLE REGISTRY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Registers the first-pass role classification
for audit-related objects.

role_registry:

  truth:
  - audit.approval_request
  - audit.audit_event

  subordinate_history:
  - audit.approval_log
  - audit.entity_status_history

  evidence:
  - audit.exec_audit_event
  - audit.ng_event

  export_boundary:
  - integration.audit_export_queue
  - integration.siem_delivery_queue

  infrastructure:
  - core.fn_audit_trail()
  - core.trg_audit_iud()
  - core.audit_trail
  - core.audit_trail_2025_12
  - core.audit_trail_2026_01
  - core.audit_trail_2026_02
  - core.audit_trail_2026_03
  - core.audit_trail_2026_04
  - core.audit_trail_2026_05
  - core.audit_trail_2026_06
  - core.audit_trail_2026_07
  - core.audit_impact_rule
  - core.audit_column_weight

conclusion:
This registry provides the first formal audit role split
across truth, history, evidence, export, and infrastructure.
