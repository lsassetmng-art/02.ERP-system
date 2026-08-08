# ============================================================
# ERP COMPANY WIDE MBO ANALYTICS AND REPORTING SURFACES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-912
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.analytics_and_reporting_surfaces
component: company-wide-mbo-analytics-and-reporting-surfaces


# PRIMARY SURFACES

- rolldown coverage rate
- alignment health distribution
- checkin submission rate
- review sheet completion rate
- evaluation-support completion rate
- department alignment gap surface


# RULE

These are derived subsystem analytical surfaces.

They must drill down to exact rolldown, alignment,
checkin, review, or evaluation-support objects
when permissions allow.

