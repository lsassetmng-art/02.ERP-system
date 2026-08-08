# ============================================================
# ERP ANALYTICS REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1876
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics.reporting_and_drilldown.rule
component: analytics-reporting-and-drilldown-rule


# PRIMARY SURFACES

- active dataset model count
- unpublished view snapshot count
- open insight backlog
- scenario execution volume
- source freshness risk count
- lineage coverage visibility

# RULE

These are derived analytics reporting surfaces.

They must drill down to owned analytics objects
when permissions allow.

