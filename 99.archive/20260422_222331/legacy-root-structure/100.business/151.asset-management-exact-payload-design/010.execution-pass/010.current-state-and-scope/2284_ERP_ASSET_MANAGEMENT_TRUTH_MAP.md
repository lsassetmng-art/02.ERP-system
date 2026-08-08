# ============================================================
# ERP ASSET MANAGEMENT TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2284
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_management.truth_map
component: asset-management-truth-map


# ASSET MANAGEMENT TRUTH MAP

Asset management owns:
- asset registry truth
- asset lifecycle truth
- acquisition capitalization readiness truth
- transfer truth
- disposal truth

Adjacent lines own:
- purchase = sourcing commitment truth
- accounting = capitalization and depreciation posting truth
- management = review and approval truth

