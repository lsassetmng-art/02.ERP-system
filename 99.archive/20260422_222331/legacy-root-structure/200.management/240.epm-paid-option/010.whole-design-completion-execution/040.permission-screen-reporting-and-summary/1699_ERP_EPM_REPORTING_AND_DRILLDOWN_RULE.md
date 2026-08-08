# ============================================================
# ERP EPM REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1699
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm.reporting_and_drilldown.rule
component: epm-reporting-and-drilldown-rule


# PRIMARY SURFACES

- objective coverage by horizon
- KPI actual vs target gap
- unpublished scorecard count
- open planning-review cycle count
- open variance case count
- company_wide_mbo inheritance readiness visibility

# RULE

These are derived EPM reporting surfaces.

They must drill down to owned EPM objects
when permissions allow.

