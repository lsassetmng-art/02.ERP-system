# ============================================================
# ERP MANUFACTURING COST MANAGEMENT VS MANUFACTURING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2786
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_cost_management_vs_manufacturing.boundary_rule
component: manufacturing-cost-management-vs-manufacturing-boundary-rule


# RULE

Manufacturing cost management owns:
- cost collection truth
- variance interpretation truth
- cost-closure truth

Manufacturing management owns:
- execution quantity truth
- completion truth

# CONSEQUENCE

A cost-collection case is not production execution truth.
A variance case is not completion ownership truth.
Cost management may consume execution visibility,
but it does not replace manufacturing-owned truth.

