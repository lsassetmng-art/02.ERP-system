# ============================================================
# ERP WMS ANALYTICS AND REPORTING SURFACES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-994
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.analytics_and_reporting_surfaces
component: wms-analytics-and-reporting-surfaces


# PRIMARY SURFACES

- available stock by warehouse
- blocked location count
- inbound receipt completion rate
- outbound pick completion rate
- count completion rate
- discrepancy open count by warehouse


# RULE

These are derived WMS analytical surfaces.

They must drill down to exact warehouse, location,
lot, receipt, pick, count, or discrepancy objects
when permissions allow.

