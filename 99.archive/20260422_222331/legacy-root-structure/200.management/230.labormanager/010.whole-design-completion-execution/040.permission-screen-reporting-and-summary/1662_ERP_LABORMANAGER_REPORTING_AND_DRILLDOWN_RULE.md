# ============================================================
# ERP LABORMANAGER REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1662
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager.reporting_and_drilldown.rule
component: labormanager-reporting-and-drilldown-rule


# PRIMARY SURFACES

- attendance exception count
- open leave request count
- lifecycle case aging
- unresolved compliance case count
- active / on_leave / terminated staff distribution
- shift-handoff mismatch visibility

# RULE

These are derived labor reporting surfaces.

They must drill down to owned labor objects
when permissions allow.

