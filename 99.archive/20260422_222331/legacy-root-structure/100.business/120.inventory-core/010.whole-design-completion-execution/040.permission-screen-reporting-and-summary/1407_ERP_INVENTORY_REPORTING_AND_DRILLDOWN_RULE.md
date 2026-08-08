# ============================================================
# ERP INVENTORY REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1407
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.reporting_and_drilldown.rule
component: inventory-reporting-and-drilldown-rule


# PRIMARY SURFACES

- on hand vs available quantity view
- reservation backlog
- open transfer request count
- adjustment request aging
- count variance distribution
- blocked or quarantined stock count

# RULE

These are derived inventory reporting surfaces.

They must drill down to owned inventory objects
when permissions allow.

