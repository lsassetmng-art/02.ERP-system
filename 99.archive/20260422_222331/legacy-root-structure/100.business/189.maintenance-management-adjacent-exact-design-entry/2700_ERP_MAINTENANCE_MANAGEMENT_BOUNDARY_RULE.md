# ============================================================
# ERP MAINTENANCE MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2700
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_management.boundary_rule
component: maintenance-management-boundary-rule


# RULE

Maintenance management owns:
- maintenance plan truth
- maintenance execution truth
- downtime truth

Asset management owns:
- asset registry truth

Manufacturing management owns:
- production execution truth

Inventory owns:
- spare-part stock truth

# CONSEQUENCE

A maintenance asset reference is not asset registry ownership truth.
A downtime event is not production execution truth.
Maintenance may constrain production visibility,
but it does not replace asset or manufacturing owned truths.

