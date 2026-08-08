# ============================================================
# ERP EPM OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-841
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.object_family_set
component: epm-object-family-set


# PRIMARY OBJECT FAMILIES

- epm_objective_node
- epm_kpi_definition
- epm_plan_cycle
- epm_review_cycle
- epm_scorecard_snapshot
- epm_forecast_record
- epm_variance_record


# RULE

Objective node is not KPI definition.
Plan cycle is not review cycle.
Scorecard snapshot is not forecast record.
Forecast record is not variance record.

