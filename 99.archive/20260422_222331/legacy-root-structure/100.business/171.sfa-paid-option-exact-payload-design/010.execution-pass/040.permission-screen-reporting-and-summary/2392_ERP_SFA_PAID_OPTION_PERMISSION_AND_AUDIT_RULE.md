# ============================================================
# ERP SFA PAID OPTION PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2392
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sfa_paid_option.permission_and_audit.rule
component: sfa-paid-option-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- sfa_read
- sfa_lead_manage
- sfa_opportunity_manage
- sfa_stage_progress_manage
- sfa_forecast_manage
- sfa_next_action_manage
- sfa_export
- sfa_audit_read
- sfa_override

# RULE

Opportunity manage does not imply override.
Forecast manage does not imply export.
Read does not imply stage-progress manage.

