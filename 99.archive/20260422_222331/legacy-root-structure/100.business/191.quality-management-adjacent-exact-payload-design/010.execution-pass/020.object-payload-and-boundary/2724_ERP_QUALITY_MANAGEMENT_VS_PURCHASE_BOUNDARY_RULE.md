# ============================================================
# ERP QUALITY MANAGEMENT VS PURCHASE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2724
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_management_vs_purchase.boundary_rule
component: quality-management-vs-purchase-boundary-rule


# RULE

Quality management owns:
- inspection and nonconformance truth
- receipt-quality decision truth

Purchase owns:
- receipt expectation truth
- sourcing commitment truth

# CONSEQUENCE

A receipt inspection is not purchase-order truth.
A nonconformance case may consume purchase references,
but it does not replace purchase-owned truth.

