# ============================================================
# ERP MAINTENANCE MANAGEMENT VS ASSET MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2754
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_management_vs_asset_management.boundary_rule
component: maintenance-management-vs-asset-management-boundary-rule


# RULE

Maintenance management owns:
- maintenance plan truth
- maintenance execution truth
- downtime truth

Asset management owns:
- asset registry truth
- asset master ownership truth

# CONSEQUENCE

A maintenance asset reference is not asset registry ownership truth.
A preventive plan is not asset-master truth.
Maintenance may consume asset references,
but it does not replace asset-management-owned truth.

