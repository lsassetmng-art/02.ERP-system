# ============================================================
# ERP SALES REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2126
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.reporting_and_drilldown.rule
component: sales-reporting-and-drilldown-rule


# PRIMARY SURFACES

- open quote count
- pending approval order count
- blocked fulfillment instruction count
- invoice handoff pending count
- correction backlog
- order-to-fulfillment lag visibility

# RULE

These are derived sales reporting surfaces.

They must drill down to owned sales objects
when permissions allow.

