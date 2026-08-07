# ============================================================
# ERP EVIDENCE CAPTURE SET INDEX
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Indexes the ERP evidence-capture documents
that move reconciliation from structural inference
to evidence-backed confirmation.

sections:

  runtime_write_path_capture:
  - 134_ERP_RUNTIME_WRITE_PATH_EVIDENCE_CAPTURE_RULE.md
  - 135_ERP_RUNTIME_WRITE_PATH_EVIDENCE_LOG_TEMPLATE.md
  - 136_ERP_RUNTIME_WRITE_PATH_TARGET_MATRIX.md
  - 137_ERP_RUNTIME_WRITE_PATH_FIRST_CAPTURE_PLAN.md

  header_write_capture:
  - 138_ERP_HEADER_WRITE_EVIDENCE_CAPTURE_RULE.md
  - 139_ERP_HEADER_WRITE_EVIDENCE_LOG_TEMPLATE.md
  - 140_ERP_HEADER_WRITE_TARGET_MATRIX.md
  - 141_ERP_HEADER_WRITE_FIRST_CAPTURE_PLAN.md

  settlement_and_ar_ap_capture:
  - 142_ERP_SETTLEMENT_EVIDENCE_CAPTURE_RULE.md
  - 143_ERP_AR_AP_EVIDENCE_CAPTURE_RULE.md
  - 144_ERP_SETTLEMENT_AND_AR_AP_EVIDENCE_LOG_TEMPLATE.md
  - 145_ERP_SETTLEMENT_AND_AR_AP_FIRST_CAPTURE_PLAN.md

  approval_subfamily_capture:
  - 146_ERP_APPROVAL_REQUEST_SUBFAMILY_EVIDENCE_CAPTURE_RULE.md
  - 147_ERP_APPROVAL_REQUEST_SUBFAMILY_EVIDENCE_LOG_TEMPLATE.md
  - 148_ERP_APPROVAL_REQUEST_SUBFAMILY_TARGET_MATRIX.md
  - 149_ERP_APPROVAL_REQUEST_SUBFAMILY_FIRST_CAPTURE_PLAN.md

meaning:
This set is the operational evidence layer
for confirming authority, mirror behavior, source-of-truth location,
and subfamily separation in the real ERP implementation.

conclusion:
Use this index when moving from
deep structural review
to actual evidence-based hardening.
