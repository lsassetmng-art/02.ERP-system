# ============================================================
# ERP COMPANY WIDE MBO REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1736
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo.reporting_and_drilldown.rule
component: company-wide-mbo-reporting-and-drilldown-rule


# PRIMARY SURFACES

- cascade completion by org scope
- open assignment count
- overdue progress review count
- evaluation support backlog
- inherited rollout readiness visibility
- personal_mbo boundary-safe comparison visibility

# RULE

These are derived company_wide_mbo reporting surfaces.

They must drill down to owned subsystem objects
when permissions allow.

