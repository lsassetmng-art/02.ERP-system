# ============================================================
# ERP MANAGEMENT REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1588
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management.reporting_and_drilldown.rule
component: management-reporting-and-drilldown-rule


# PRIMARY SURFACES

- open review-cycle count
- unresolved escalation count
- directive completion backlog
- watchlist aging distribution
- cross-module high-risk visibility
- finalized decision volume

# RULE

These are derived management reporting surfaces.

They must drill down to owned management objects
when permissions allow.

