# ============================================================
# ERP MAINTENANCE MANAGEMENT LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2763
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.maintenance_management.lifecycle_and_statusflow.rule
component: maintenance-management-lifecycle-and-statusflow-rule


# MAINTENANCE ASSET REFERENCE STATUS SET

- active
- constrained
- inactive
- retired
- archived


# PREVENTIVE MAINTENANCE PLAN STATUS SET

- drafted
- active
- suspended
- completed
- archived


# MAINTENANCE WORK ORDER STATUS SET

- opened
- scheduled
- released
- completed
- canceled
- archived


# MAINTENANCE EXECUTION STATUS SET

- queued
- in_progress
- paused
- completed
- aborted
- archived


# MAINTENANCE DOWNTIME EVENT STATUS SET

- open
- active
- resolved
- reviewed
- archived

