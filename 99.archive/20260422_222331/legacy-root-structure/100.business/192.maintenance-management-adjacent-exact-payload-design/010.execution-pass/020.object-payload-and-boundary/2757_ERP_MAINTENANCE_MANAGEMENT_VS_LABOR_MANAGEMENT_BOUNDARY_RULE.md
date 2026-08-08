# ============================================================
# ERP MAINTENANCE MANAGEMENT VS LABOR MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2757
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_management_vs_labor_management.boundary_rule
component: maintenance-management-vs-labor-management-boundary-rule


# RULE

Maintenance management owns:
- work-order truth
- execution truth

Labor management owns:
- labor assignment truth
- attendance and labor governance truth

# CONSEQUENCE

An assigned maintenance team reference is not labor-assignment ownership truth.
Maintenance may consume labor visibility,
but it does not replace labor-management-owned truth.

