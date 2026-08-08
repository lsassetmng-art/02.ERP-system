# ============================================================
# ERP MANUFACTURING COST MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2707
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_cost_management.boundary_rule
component: manufacturing-cost-management-boundary-rule


# RULE

Manufacturing cost management owns:
- cost collection truth
- variance interpretation truth
- cost-closure truth

Manufacturing management owns:
- execution truth

Accounting owns:
- posting truth

Inventory owns:
- quantity and movement truth

# CONSEQUENCE

A variance case is not journal truth.
A cost-collection case is not execution ownership truth.
Manufacturing cost management may expose posting visibility,
but it does not replace accounting-owned truth.

