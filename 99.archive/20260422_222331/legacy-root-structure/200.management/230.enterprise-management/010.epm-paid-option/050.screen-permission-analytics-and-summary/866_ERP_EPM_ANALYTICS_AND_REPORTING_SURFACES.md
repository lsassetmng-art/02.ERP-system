# ============================================================
# ERP EPM ANALYTICS AND REPORTING SURFACES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-866
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.epm_option.analytics_and_reporting_surfaces
component: epm-analytics-and-reporting-surfaces


# PRIMARY SURFACES

- objective count by status
- KPI health distribution
- review cycle completion rate
- scorecard status color distribution
- forecast vs actual variance surface
- department objective progress surface


# RULE

These are derived EPM analytical surfaces.

They must drill down to exact objective, KPI, review,
scorecard, forecast, or variance objects when permissions allow.

