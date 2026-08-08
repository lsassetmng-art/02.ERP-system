# ============================================================
# ERP INCIDENT GOVERNANCE LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2922
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.incident_governance.lifecycle_and_statusflow.rule
component: incident-governance-lifecycle-and-statusflow-rule


# INCIDENT CASE STATUS SET

- opened
- triaging
- assigned
- escalated
- monitoring
- resolved
- closed
- archived


# OPERATOR WORK ITEM STATUS SET

- queued
- acknowledged
- in_progress
- waiting_dependency
- completed
- canceled
- archived


# ESCALATION DECISION STATUS SET

- pending
- decided
- acknowledged
- completed
- archived


# SLO REVIEW STATUS SET

- opened
- reviewing
- decided
- closed
- archived


# SUPPRESSION OVERRIDE STATUS SET

- pending
- active
- expired
- revoked
- archived


# POSTINCIDENT REVIEW STATUS SET

- opened
- drafting
- reviewed
- closed
- archived

