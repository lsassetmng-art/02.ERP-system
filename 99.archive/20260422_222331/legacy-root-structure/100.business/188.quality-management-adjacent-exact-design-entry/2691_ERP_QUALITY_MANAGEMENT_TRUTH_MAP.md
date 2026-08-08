# ============================================================
# ERP QUALITY MANAGEMENT TRUTH MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2691
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_management.truth_map
component: quality-management-truth-map


# QUALITY MANAGEMENT TRUTH MAP

Quality management owns:
- inspection truth
- nonconformance truth
- hold truth
- corrective action truth
- release decision truth

Adjacent lines own:
- manufacturing management = production execution truth
- inventory = stock truth
- purchase = receipt expectation truth
- management = review and approval truth

