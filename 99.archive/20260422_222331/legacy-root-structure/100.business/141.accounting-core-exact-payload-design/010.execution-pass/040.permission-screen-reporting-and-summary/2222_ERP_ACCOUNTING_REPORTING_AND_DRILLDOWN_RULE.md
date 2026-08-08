# ============================================================
# ERP ACCOUNTING REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2222
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.reporting_and_drilldown.rule
component: accounting-reporting-and-drilldown-rule


# PRIMARY SURFACES

- pending draft approval count
- unposted journal batch count
- overdue receivable-payable backlog
- close-cycle review backlog
- correction backlog
- posting-to-close lag visibility

# RULE

These are derived accounting reporting surfaces.

They must drill down to owned accounting objects
when permissions allow.

