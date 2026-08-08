# ============================================================
# ERP SHIFTMANAGER ANALYTICS AND REPORTING SURFACES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-826
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.analytics_and_reporting_surfaces
component: shiftmanager-analytics-and-reporting-surfaces


# PRIMARY SURFACES

- unfilled shift slot count
- understaffed shift count
- preference fulfillment rate
- open swap request count
- assignment decline count
- publication timeliness surface


# RULE

These are derived shift analytical surfaces.

They must drill down to exact plan, assignment,
preference, or swap objects when permissions allow.

