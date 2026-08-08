# ============================================================
# ERP ASSET MANAGEMENT REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2312
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_management.reporting_and_drilldown.rule
component: asset-management-reporting-and-drilldown-rule


# PRIMARY SURFACES

- active asset count
- capitalization pending count
- depreciation handoff pending count
- transfer backlog
- disposal pending approval count
- net book value visibility

# RULE

These are derived asset-management reporting surfaces.

They must drill down to owned asset-management objects
when permissions allow.

