# ============================================================
# ERP GOVERNANCE LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1615
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance.lifecycle_and_statusflow.rule
component: governance-lifecycle-and-statusflow-rule


# CONTROL POLICY STATUS SET

- draft
- active
- suspended
- archived


# CONTROL REQUIREMENT STATUS SET

- draft
- active
- retired
- archived


# EXCEPTION CASE STATUS SET

- open
- triaged
- in_review
- resolved
- archived


# OVERRIDE APPROVAL STATUS SET

- requested
- approved
- rejected
- expired
- archived


# SIGNOFF RECORD STATUS SET

- open
- signed
- rejected
- superseded
- archived

