# ============================================================
# ERP ASSET MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2278
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_management.boundary_rule
component: asset-management-boundary-rule


# RULE

Asset management owns:
- asset lifecycle truth
- transfer truth
- disposal decision target truth

Purchase owns:
- sourcing and procurement truth

Accounting owns:
- capitalization posting truth
- depreciation posting truth
- disposal accounting truth

Management owns:
- review and approval truth

# CONSEQUENCE

Procurement of an item is not yet asset lifecycle truth.
An asset depreciation cycle is not accounting-owned journal truth.
A disposal request is not itself an accounting posting truth.
An approval gate is not asset ownership truth.

