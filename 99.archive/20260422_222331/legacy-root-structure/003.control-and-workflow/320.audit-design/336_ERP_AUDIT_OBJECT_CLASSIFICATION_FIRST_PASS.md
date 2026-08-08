# ============================================================
# ERP AUDIT OBJECT CLASSIFICATION FIRST PASS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass classification
for audit-related objects after inventory review.

classification:

  approval_audit_truth:
  - audit.approval_request
  - audit.approval_log

  generic_audit_event_truth:
  - audit.audit_event

  execution_linked_audit:
  - audit.exec_audit_event

  status_and_anomaly_audit:
  - audit.entity_status_history
  - audit.ng_event

  export_and_external_delivery:
  - integration.audit_export_queue
  - integration.siem_delivery_queue

  cross_cutting_audit_infrastructure:
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
Audit is best understood as a multi-layer architecture,
not as a single-table family.
