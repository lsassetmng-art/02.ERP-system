# ============================================================
# ERP OBJECTIVE LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3210
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.objective.lifecycle_and_statusflow.rule
component: objective-lifecycle-and-statusflow-rule


# OBJECTIVE FUNCTION PROFILE STATUS SET

- draft
- active
- restricted
- superseded
- archived


# EXCEPTION HIERARCHY PROFILE STATUS SET

- draft
- active
- restricted
- superseded
- archived


# DELEGATION POLICY PROFILE STATUS SET

- draft
- active
- restricted
- superseded
- archived


# OBJECTIVE EVALUATION CASE STATUS SET

- opened
- evaluating
- decided
- rejected
- archived


# EXCEPTION RESOLUTION CASE STATUS SET

- opened
- routing
- resolved
- rejected
- archived


# DELEGATION DECISION CASE STATUS SET

- pending
- approved
- rejected
- applied
- archived


# DELEGATION APPLICATION SUMMARY STATUS SET

- drafted
- applied
- superseded
- archived

