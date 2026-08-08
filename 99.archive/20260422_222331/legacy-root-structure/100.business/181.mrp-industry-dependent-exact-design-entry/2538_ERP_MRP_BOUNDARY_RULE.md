# ============================================================
# ERP MRP BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2538
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.mrp.boundary_rule
component: mrp-boundary-rule


# RULE

MRP owns:
- planning truth
- recommendation truth

Purchase owns:
- purchase execution truth

Manufacturing management owns:
- production execution truth

Inventory owns:
- stock truth

# CONSEQUENCE

A replenishment recommendation is not a purchase order.
A planned supply order is not a production execution truth.
MRP may propose downstream actions,
but it does not replace downstream-owned truths.

