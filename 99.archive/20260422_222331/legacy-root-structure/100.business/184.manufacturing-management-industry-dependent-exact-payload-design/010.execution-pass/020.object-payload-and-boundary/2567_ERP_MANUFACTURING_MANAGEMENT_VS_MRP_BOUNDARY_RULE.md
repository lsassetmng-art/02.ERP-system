# ============================================================
# ERP MANUFACTURING MANAGEMENT VS MRP BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2567
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_management_vs_mrp.boundary_rule
component: manufacturing-management-vs-mrp-boundary-rule


# RULE

Manufacturing management owns:
- production execution truth
- completion truth

MRP owns:
- requirement planning truth
- planned supply proposal truth

# CONSEQUENCE

A production order is not a replenishment recommendation.
A completion case is not a shortage projection truth.
Manufacturing may consume MRP references,
but it does not replace MRP-owned planning truth.

