# ============================================================
# ERP ASSET MANAGEMENT VS PURCHASE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2294
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.asset_management_vs_purchase.boundary_rule
component: asset-management-vs-purchase-boundary-rule


# RULE

Asset management owns:
- asset lifecycle truth
- capitalization readiness truth

Purchase owns:
- sourcing commitment truth
- supplier procurement truth

# CONSEQUENCE

A purchase order is not asset lifecycle truth.
Acquisition linkage may consume purchase references,
but it does not replace purchase-owned sourcing truth.

