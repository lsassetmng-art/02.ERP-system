# ============================================================
# ERP MANUFACTURING COST MANAGEMENT VS INVENTORY BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2788
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_cost_management_vs_inventory.boundary_rule
component: manufacturing-cost-management-vs-inventory-boundary-rule


# RULE

Manufacturing cost management owns:
- cost collection truth
- variance interpretation truth

Inventory owns:
- quantity truth
- movement truth
- valuation input visibility

# CONSEQUENCE

An accumulated actual cost is not inventory quantity truth.
A variance case is not movement ownership truth.
Cost management may consume quantity visibility,
but it does not replace inventory-owned truth.

