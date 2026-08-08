# ============================================================
# ERP EPM LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1689
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm.lifecycle_and_statusflow.rule
component: epm-lifecycle-and-statusflow-rule


# OBJECTIVE SET STATUS SET

- draft
- active
- frozen
- archived


# KPI METRIC STATUS SET

- draft
- active
- retired
- archived


# SCORECARD SNAPSHOT STATUS SET

- open
- published
- superseded
- archived


# PLANNING REVIEW CYCLE STATUS SET

- scheduled
- open
- in_review
- closed
- archived


# VARIANCE CASE STATUS SET

- open
- triaged
- actioned
- closed
- archived

