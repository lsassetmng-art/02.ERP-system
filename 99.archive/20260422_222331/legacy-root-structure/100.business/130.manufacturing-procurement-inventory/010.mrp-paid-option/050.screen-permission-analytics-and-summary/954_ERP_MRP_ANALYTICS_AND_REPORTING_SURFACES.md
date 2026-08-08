# ============================================================
# ERP MRP ANALYTICS AND REPORTING SURFACES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-954
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.analytics_and_reporting_surfaces
component: mrp-analytics-and-reporting-surfaces


# PRIMARY SURFACES

- shortage count by site
- planned order volume by period
- purchase recommendation volume by supplier
- critical exception count by item
- lead-time risk surface
- run output summary by horizon


# RULE

These are derived MRP analytical surfaces.

They must drill down to exact demand, BOM, run,
planned order, recommendation, or exception objects
when permissions allow.

