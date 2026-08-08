# ============================================================
# ERP AUDIT LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1796
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.audit.lifecycle_and_statusflow.rule
component: audit-lifecycle-and-statusflow-rule


# AUDIT ENGAGEMENT STATUS SET

- planned
- in_progress
- fieldwork_completed
- concluded
- archived


# AUDIT EVIDENCE ITEM STATUS SET

- open
- collected
- reviewed
- invalidated
- archived


# AUDIT FINDING CASE STATUS SET

- open
- triaged
- in_remediation
- closed
- archived


# AUDIT CONCLUSION RECORD STATUS SET

- drafted
- finalized
- superseded
- archived


# AUDIT FOLLOWUP CLOSURE STATUS SET

- open
- verified
- closed
- reopened
- archived

