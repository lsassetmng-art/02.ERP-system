# ============================================================
# ERP GOVERNANCE REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1625
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance.reporting_and_drilldown.rule
component: governance-reporting-and-drilldown-rule


# PRIMARY SURFACES

- active control policy count
- overdue signoff backlog
- open exception count
- approved override volume
- control gap aging
- policy coverage by control area

# RULE

These are derived governance reporting surfaces.

They must drill down to owned governance objects
when permissions allow.

