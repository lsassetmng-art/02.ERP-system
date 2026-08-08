# ============================================================
# ERP QUALITY MANAGEMENT LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2730
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality_management.lifecycle_and_statusflow.rule
component: quality-management-lifecycle-and-statusflow-rule


# QUALITY INSPECTION STATUS SET

- planned
- in_progress
- passed
- failed
- waived
- archived


# QUALITY NONCONFORMANCE STATUS SET

- open
- under_review
- dispositioned
- closed
- archived


# QUALITY HOLD STATUS SET

- placed
- reviewing
- released
- scrapped
- archived


# CORRECTIVE ACTION STATUS SET

- opened
- assigned
- in_progress
- verified
- closed
- archived


# QUALITY RELEASE DECISION STATUS SET

- pending
- released
- rejected
- overridden
- archived

