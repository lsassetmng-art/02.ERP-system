# ============================================================
# ERP QUALITY MANAGEMENT VS MANUFACTURING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2722
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_management_vs_manufacturing.boundary_rule
component: quality-management-vs-manufacturing-boundary-rule


# RULE

Quality management owns:
- inspection truth
- nonconformance truth
- release-decision truth

Manufacturing management owns:
- production execution truth
- completion truth

# CONSEQUENCE

An inspection case is not production execution truth.
A release decision is not production completion truth.
Quality may constrain execution visibility,
but it does not replace manufacturing-owned truth.

