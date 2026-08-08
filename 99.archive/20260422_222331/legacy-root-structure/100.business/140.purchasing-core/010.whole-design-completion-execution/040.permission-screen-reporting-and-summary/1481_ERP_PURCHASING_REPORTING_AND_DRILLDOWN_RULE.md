# ============================================================
# ERP PURCHASING REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1481
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchasing.reporting_and_drilldown.rule
component: purchasing-reporting-and-drilldown-rule


# PRIMARY SURFACES

- open purchase request count
- unapproved purchase order count
- overdue receipt expectation count
- supplier return backlog
- order amendment and cancellation volume
- spend commitment by supplier

# RULE

These are derived purchasing reporting surfaces.

They must drill down to owned purchasing objects
when permissions allow.

