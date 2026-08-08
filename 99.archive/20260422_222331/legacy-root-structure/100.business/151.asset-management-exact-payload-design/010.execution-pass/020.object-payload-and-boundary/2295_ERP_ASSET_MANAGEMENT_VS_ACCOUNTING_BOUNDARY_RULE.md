# ============================================================
# ERP ASSET MANAGEMENT VS ACCOUNTING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2295
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_management_vs_accounting.boundary_rule
component: asset-management-vs-accounting-boundary-rule


# RULE

Asset management owns:
- asset master truth
- asset lifecycle truth
- transfer truth
- disposal request truth

Accounting owns:
- capitalization posting truth
- depreciation journal truth
- disposal accounting truth

# CONSEQUENCE

A depreciation cycle is not journal truth.
A disposal request is not accounting-owned posting truth.
Accounting handoff state is not accounting ownership transfer.

