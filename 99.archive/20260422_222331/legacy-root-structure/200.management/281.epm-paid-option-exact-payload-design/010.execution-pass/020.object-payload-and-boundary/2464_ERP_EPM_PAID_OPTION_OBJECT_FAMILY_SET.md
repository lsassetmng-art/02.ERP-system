# ============================================================
# ERP EPM PAID OPTION OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2464
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm_paid_option.object_family_set
component: epm-paid-option-object-family-set


# PRIMARY OBJECT FAMILIES

- performance_plan_case
- budget_coordination_case
- forecast_coordination_case
- variance_analysis_snapshot
- management_dashboard_snapshot

# RULE

Performance plan is not budget coordination.
Budget coordination is not forecast coordination.
Forecast coordination is not variance snapshot.
Variance snapshot is not dashboard snapshot.

