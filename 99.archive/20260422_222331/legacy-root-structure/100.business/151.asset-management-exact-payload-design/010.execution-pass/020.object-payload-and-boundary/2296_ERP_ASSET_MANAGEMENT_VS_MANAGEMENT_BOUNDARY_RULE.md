# ============================================================
# ERP ASSET MANAGEMENT VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2296
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_management_vs_management.boundary_rule
component: asset-management-vs-management-boundary-rule


# RULE

Asset management owns:
- asset lifecycle truth
- transfer truth
- disposal target truth

Management owns:
- review truth
- approval truth
- escalation truth

# CONSEQUENCE

Approval visibility may constrain asset progression,
but management does not replace asset-owned lifecycle truth.

