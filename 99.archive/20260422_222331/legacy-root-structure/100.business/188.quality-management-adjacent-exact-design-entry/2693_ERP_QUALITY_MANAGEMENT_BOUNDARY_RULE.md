# ============================================================
# ERP QUALITY MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2693
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_management.boundary_rule
component: quality-management-boundary-rule


# RULE

Quality management owns:
- inspection truth
- hold and release truth
- nonconformance truth

Manufacturing management owns:
- production execution truth

Inventory owns:
- stock truth

Purchase owns:
- receipt expectation truth

# CONSEQUENCE

An inspection case is not production execution truth.
A quality hold is not stock ledger ownership truth.
Quality may constrain downstream movement,
but it does not replace manufacturing or inventory owned truths.

