# ============================================================
# ERP SFA OPTION PERMISSION AND ROLE MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-748
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.permission_and_role_matrix
component: sfa-option-permission-and-role-matrix


# RECOMMENDED ROLES

- sfa_option_admin
- sfa_manager
- sfa_operator
- sfa_forecast_analyst
- sfa_audit_reviewer


# RECOMMENDED CAPABILITY FAMILIES

- sfa_lead_read
- sfa_lead_write
- sfa_opportunity_read
- sfa_opportunity_write
- sfa_stage_transition
- sfa_sales_action_write
- sfa_forecast_read
- sfa_export
- sfa_audit_read
- sfa_controlled_reopen


# RULE

Opportunity read does not imply stage transition.
Forecast read does not imply export.
Write does not imply controlled reopen.

