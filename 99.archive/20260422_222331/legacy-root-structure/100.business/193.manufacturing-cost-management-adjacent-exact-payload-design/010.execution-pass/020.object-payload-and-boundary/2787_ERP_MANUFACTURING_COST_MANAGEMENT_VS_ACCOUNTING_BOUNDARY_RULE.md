# ============================================================
# ERP MANUFACTURING COST MANAGEMENT VS ACCOUNTING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2787
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_cost_management_vs_accounting.boundary_rule
component: manufacturing-cost-management-vs-accounting-boundary-rule


# RULE

Manufacturing cost management owns:
- cost analysis truth
- cost-closure truth
- variance interpretation truth

Accounting owns:
- posting truth
- journal truth
- period-close ownership truth

# CONSEQUENCE

A cost-closure case is not journal truth.
A posting handoff state is not accounting ownership truth.
Cost management may hand off posting visibility,
but it does not replace accounting-owned truth.

