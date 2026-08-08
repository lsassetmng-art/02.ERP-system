# ============================================================
# ERP ASSET MANAGEMENT LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2301
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_management.lifecycle_and_statusflow.rule
component: asset-management-lifecycle-and-statusflow-rule


# ASSET MASTER STATUS SET

- active
- suspended
- disposed
- retired
- archived


# ACQUISITION CASE STATUS SET

- draft
- under_review
- capitalization_ready
- capitalized
- rejected
- archived


# DEPRECIATION CYCLE STATUS SET

- scheduled
- calculated
- handed_off
- posted
- adjusted
- archived


# TRANSFER CASE STATUS SET

- draft
- pending_approval
- approved
- completed
- canceled
- archived


# DISPOSAL CASE STATUS SET

- draft
- pending_approval
- approved
- disposed
- reversed
- archived

