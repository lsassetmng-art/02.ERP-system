# ============================================================
# ERP EPM PAID OPTION PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2483
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm_paid_option.permission_and_audit.rule
component: epm-paid-option-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- epm_read
- epm_plan_manage
- epm_budget_manage
- epm_forecast_manage
- epm_variance_manage
- epm_dashboard_manage
- epm_export
- epm_audit_read
- epm_override

# RULE

Budget manage does not imply override.
Dashboard manage does not imply export.
Read does not imply variance manage.

