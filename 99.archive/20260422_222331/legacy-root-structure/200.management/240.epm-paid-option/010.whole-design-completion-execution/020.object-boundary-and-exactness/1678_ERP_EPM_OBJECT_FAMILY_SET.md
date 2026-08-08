# ============================================================
# ERP EPM OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1678
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm.object_family_set
component: epm-object-family-set


# PRIMARY OBJECT FAMILIES

- epm_objective_set
- epm_kpi_metric
- epm_scorecard_snapshot
- epm_planning_review_cycle
- epm_variance_case

# RULE

Objective set is not KPI metric.
KPI metric is not scorecard snapshot.
Scorecard snapshot is not planning review cycle.
Planning review cycle is not variance case.

