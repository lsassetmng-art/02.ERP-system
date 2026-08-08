# ============================================================
# ERP LABOR LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1652
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labor.lifecycle_and_statusflow.rule
component: labor-lifecycle-and-statusflow-rule


# STAFF PROFILE STATUS SET

- active
- on_leave
- suspended
- terminated
- archived


# ATTENDANCE RECORD STATUS SET

- open
- submitted
- approved
- rejected
- archived


# LEAVE REQUEST STATUS SET

- draft
- submitted
- approved
- rejected
- canceled
- archived


# EMPLOYMENT LIFECYCLE CASE STATUS SET

- open
- in_progress
- completed
- canceled
- archived


# LABOR COMPLIANCE CASE STATUS SET

- open
- in_review
- escalated
- resolved
- archived

