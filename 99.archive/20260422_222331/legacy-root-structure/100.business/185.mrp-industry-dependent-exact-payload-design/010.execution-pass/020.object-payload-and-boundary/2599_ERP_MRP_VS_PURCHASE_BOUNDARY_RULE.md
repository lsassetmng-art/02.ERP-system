# ============================================================
# ERP MRP VS PURCHASE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2599
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.mrp_vs_purchase.boundary_rule
component: mrp-vs-purchase-boundary-rule


# RULE

MRP owns:
- requirement planning truth
- replenishment recommendation truth

Purchase owns:
- sourcing commitment truth
- purchase execution truth

# CONSEQUENCE

A replenishment recommendation is not a purchase order.
A planned supply case is not supplier commitment truth.
MRP may feed purchase,
but it does not replace purchase-owned truth.

