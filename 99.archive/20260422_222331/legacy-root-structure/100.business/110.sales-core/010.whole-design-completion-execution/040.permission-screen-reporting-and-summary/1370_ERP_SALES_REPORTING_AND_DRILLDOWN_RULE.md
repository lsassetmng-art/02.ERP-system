# ============================================================
# ERP SALES REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1370
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.reporting_and_drilldown.rule
component: sales-reporting-and-drilldown-rule


# PRIMARY SURFACES

- quote conversion rate
- open order count
- fulfilled order count
- billing release backlog
- return request aging
- cancellation and reversal volume

# RULE

These are derived sales reporting surfaces.

They must drill down to owned sales objects
when permissions allow.

