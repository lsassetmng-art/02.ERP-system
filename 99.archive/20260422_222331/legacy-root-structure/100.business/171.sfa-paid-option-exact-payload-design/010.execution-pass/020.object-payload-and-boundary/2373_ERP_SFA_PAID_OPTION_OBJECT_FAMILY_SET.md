# ============================================================
# ERP SFA PAID OPTION OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2373
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sfa_paid_option.object_family_set
component: sfa-paid-option-object-family-set


# PRIMARY OBJECT FAMILIES

- sales_lead
- sales_opportunity
- opportunity_stage_progression
- sales_forecast_case
- next_action_task

# RULE

Sales lead is not sales opportunity.
Sales opportunity is not stage progression.
Stage progression is not forecast case.
Forecast case is not next-action task.

