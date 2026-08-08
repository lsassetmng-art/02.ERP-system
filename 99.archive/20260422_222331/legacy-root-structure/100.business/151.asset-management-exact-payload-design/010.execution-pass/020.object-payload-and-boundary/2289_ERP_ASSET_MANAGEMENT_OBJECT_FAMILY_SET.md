# ============================================================
# ERP ASSET MANAGEMENT OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2289
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_management.object_family_set
component: asset-management-object-family-set


# PRIMARY OBJECT FAMILIES

- asset_master
- asset_acquisition_case
- asset_depreciation_cycle
- asset_transfer_case
- asset_disposal_case

# RULE

Asset master is not acquisition case.
Acquisition case is not depreciation cycle.
Depreciation cycle is not transfer case.
Transfer case is not disposal case.

