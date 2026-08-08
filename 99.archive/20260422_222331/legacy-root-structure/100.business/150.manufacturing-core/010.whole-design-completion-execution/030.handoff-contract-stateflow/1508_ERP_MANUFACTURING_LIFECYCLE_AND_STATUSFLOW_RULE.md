# ============================================================
# ERP MANUFACTURING LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1508
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing.lifecycle_and_statusflow.rule
component: manufacturing-lifecycle-and-statusflow-rule


# PRODUCTION ORDER STATUS SET

- draft
- released
- in_progress
- completed
- canceled
- archived


# OPERATION STATUS SET

- open
- ready
- in_progress
- completed
- blocked
- archived


# MATERIAL ISSUE REQUEST STATUS SET

- open
- released
- issued
- canceled
- archived


# COMPLETION RECEIPT STATUS SET

- open
- approved
- received
- closed
- archived


# SCRAP DECLARATION STATUS SET

- open
- reviewed
- approved
- posted
- archived

