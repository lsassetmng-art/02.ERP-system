# ============================================================
# ERP CALIBRATION PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3057
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.calibration.permission_and_audit.rule
component: calibration-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- calibration_read
- freshness_policy_manage
- evidence_weighting_manage
- recommendation_calibration_manage
- calibration_evaluation_manage
- calibration_export
- calibration_audit_read
- calibration_override

# RULE

Recommendation calibration manage does not imply override.
Evaluation manage does not imply export.
Read does not imply weighting manage.

