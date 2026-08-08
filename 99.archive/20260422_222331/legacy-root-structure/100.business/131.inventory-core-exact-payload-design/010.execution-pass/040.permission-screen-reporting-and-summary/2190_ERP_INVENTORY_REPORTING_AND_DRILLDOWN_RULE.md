# ============================================================
# ERP INVENTORY REPORTING AND DRILLDOWN RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2190
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.reporting_and_drilldown.rule
component: inventory-reporting-and-drilldown-rule


# PRIMARY SURFACES

- low stock ledger count
- blocked movement count
- open reservation backlog
- adjustment review backlog
- replenishment signal backlog
- stock aging and availability visibility

# RULE

These are derived inventory reporting surfaces.

They must drill down to owned inventory objects
when permissions allow.

