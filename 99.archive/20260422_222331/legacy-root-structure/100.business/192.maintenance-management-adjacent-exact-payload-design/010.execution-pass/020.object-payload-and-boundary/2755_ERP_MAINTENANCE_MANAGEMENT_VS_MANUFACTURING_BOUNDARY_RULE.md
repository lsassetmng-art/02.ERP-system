# ============================================================
# ERP MAINTENANCE MANAGEMENT VS MANUFACTURING_BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2755
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_management_vs_manufacturing.boundary_rule
component: maintenance-management-vs-manufacturing-boundary-rule


# RULE

Maintenance management owns:
- maintenance execution truth
- downtime truth

Manufacturing management owns:
- production execution truth
- work-center load truth

# CONSEQUENCE

A downtime event is not production execution truth.
A maintenance work order is not manufacturing order truth.
Maintenance may constrain capacity visibility,
but it does not replace manufacturing-owned truth.

