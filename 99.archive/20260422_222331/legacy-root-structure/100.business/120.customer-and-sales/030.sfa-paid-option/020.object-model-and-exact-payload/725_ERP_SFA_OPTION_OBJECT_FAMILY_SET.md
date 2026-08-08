# ============================================================
# ERP SFA OPTION OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-725
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.object_family_set
component: sfa-option-object-family-set


# PRIMARY OBJECT FAMILIES

- sfa_lead
- sfa_opportunity
- sfa_sales_action
- sfa_pipeline_forecast_snapshot
- sfa_stage_history
- sfa_opportunity_owner_assignment
- sfa_loss_reason_record
- sfa_win_result_record


# RULE

Lead is not opportunity.
Opportunity is not action.
Action is not forecast.
Forecast is not source commercial execution truth.

