# ============================================================
# ERP EPM PERMISSION AND ROLE MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-865
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.permission_and_role_matrix
component: epm-permission-and-role-matrix


# RECOMMENDED ROLES

- epm_option_admin
- epm_manager
- epm_planner
- epm_reviewer
- epm_readonly_analyst
- epm_audit_reviewer


# RECOMMENDED CAPABILITY FAMILIES

- epm_objective_read
- epm_objective_write
- epm_kpi_write
- epm_plan_cycle_write
- epm_review_cycle_write
- epm_scorecard_read
- epm_forecast_write
- epm_variance_write
- epm_export
- epm_audit_read
- epm_override_transition


# RULE

Objective write does not imply override transition.
Scorecard read does not imply KPI write.
Forecast write does not imply export.

