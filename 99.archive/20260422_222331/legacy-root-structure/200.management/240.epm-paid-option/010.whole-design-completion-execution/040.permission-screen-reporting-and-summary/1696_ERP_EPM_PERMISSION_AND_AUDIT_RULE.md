# ============================================================
# ERP EPM PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1696
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm.permission_and_audit.rule
component: epm-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- epm_read
- epm_objective_write
- epm_kpi_write
- epm_scorecard_publish
- epm_planning_review_manage
- epm_export
- epm_audit_read
- epm_override

# RULE

EPM objective write does not imply scorecard publish.
Planning review manage does not imply epm override.
Read does not imply export.

