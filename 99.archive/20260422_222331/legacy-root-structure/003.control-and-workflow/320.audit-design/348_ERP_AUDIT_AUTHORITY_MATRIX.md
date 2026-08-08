# ============================================================
# ERP AUDIT AUTHORITY MATRIX
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass authority matrix
for audit-related objects.

authority_matrix:

  audit.approval_request:
    authority_role:
    - audit truth anchor
    authority_strength:
    - strong
    notes:
    - primary approval audit truth carrier

  audit.approval_log:
    authority_role:
    - subordinate approval history
    authority_strength:
    - medium
    notes:
    - linked action/decision log under approval_request

  audit.audit_event:
    authority_role:
    - generic audit event authority
    authority_strength:
    - strong
    notes:
    - generic event-level audit truth

  audit.exec_audit_event:
    authority_role:
    - execution-linked audit evidence
    authority_strength:
    - medium
    notes:
    - narrower execution event family

  audit.entity_status_history:
    authority_role:
    - status history authority
    authority_strength:
    - medium
    notes:
    - entity state transition history

  audit.ng_event:
    authority_role:
    - anomaly / NG event authority
    authority_strength:
    - medium
    notes:
    - severity / quarantine / anomaly event layer

  integration.audit_export_queue:
    authority_role:
    - export boundary queue
    authority_strength:
    - low_as_truth
    notes:
    - outbound delivery boundary, not primary audit truth

  integration.siem_delivery_queue:
    authority_role:
    - SIEM delivery boundary queue
    authority_strength:
    - low_as_truth
    notes:
    - delivery boundary, not primary audit truth

conclusion:
Audit authority is distributed across differentiated objects,
with stronger truth concentrated in approval_request and audit_event families.
