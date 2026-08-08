# ============================================================
# ERP PURCHASE REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2158
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase.reporting_and_drilldown.rule
component: purchase-reporting-and-drilldown-rule


# PRIMARY SURFACES

- open request count
- pending approval order count
- blocked receipt expectation count
- supplier invoice handoff pending count
- correction backlog
- order-to-receipt lag visibility

# RULE

These are derived purchase reporting surfaces.

They must drill down to owned purchase objects
when permissions allow.

