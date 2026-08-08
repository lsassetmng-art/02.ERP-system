# ============================================================
# ERP MANUFACTURING REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1518
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing.reporting_and_drilldown.rule
component: manufacturing-reporting-and-drilldown-rule


# PRIMARY SURFACES

- open production order count
- operation delay backlog
- material issue backlog
- completion receipt throughput
- scrap rate and scrap volume
- blocked operation count

# RULE

These are derived manufacturing reporting surfaces.

They must drill down to owned manufacturing objects
when permissions allow.

