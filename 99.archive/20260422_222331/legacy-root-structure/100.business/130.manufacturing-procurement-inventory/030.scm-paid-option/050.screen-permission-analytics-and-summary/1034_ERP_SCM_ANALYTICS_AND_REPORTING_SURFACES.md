# ============================================================
# ERP SCM ANALYTICS AND REPORTING SURFACES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1034
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.analytics_and_reporting_surfaces
component: scm-analytics-and-reporting-surfaces


# PRIMARY SURFACES

- node count by risk tier
- supplier watchlist count
- constrained lane count
- replenishment signal volume by horizon
- active disruption count by severity
- resilience flag distribution


# RULE

These are derived SCM analytical surfaces.

They must drill down to exact node, supplier, lane,
plan, signal, recommendation, disruption, or resilience objects
when permissions allow.

