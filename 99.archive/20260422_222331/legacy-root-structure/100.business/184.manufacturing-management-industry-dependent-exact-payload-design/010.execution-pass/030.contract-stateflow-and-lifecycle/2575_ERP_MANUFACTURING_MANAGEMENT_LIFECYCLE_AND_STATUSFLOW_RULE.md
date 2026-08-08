# ============================================================
# ERP MANUFACTURING MANAGEMENT LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2575
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_management.lifecycle_and_statusflow.rule
component: manufacturing-management-lifecycle-and-statusflow-rule


# PRODUCTION ORDER STATUS SET

- draft
- released
- in_progress
- completed
- canceled
- archived


# BOM REFERENCE STATUS SET

- draft
- active
- superseded
- retired
- archived


# WORK CENTER LOAD STATUS SET

- planned
- allocated
- overloaded
- completed
- archived


# PRODUCTION EXECUTION STATUS SET

- queued
- running
- paused
- completed
- aborted
- archived


# PRODUCTION COMPLETION STATUS SET

- draft
- confirmed
- inventory_handed_off
- accounting_handed_off
- closed
- archived

