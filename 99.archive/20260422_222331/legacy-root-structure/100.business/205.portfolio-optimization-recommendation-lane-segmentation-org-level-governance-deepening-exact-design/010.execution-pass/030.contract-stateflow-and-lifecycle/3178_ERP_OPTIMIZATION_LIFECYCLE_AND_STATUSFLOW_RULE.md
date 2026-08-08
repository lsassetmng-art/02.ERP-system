# ============================================================
# ERP OPTIMIZATION LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3178
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.optimization.lifecycle_and_statusflow.rule
component: optimization-lifecycle-and-statusflow-rule


# PORTFOLIO OPTIMIZATION PROFILE STATUS SET

- draft
- active
- restricted
- superseded
- archived


# RECOMMENDATION LANE SEGMENTATION PROFILE STATUS SET

- draft
- active
- restricted
- superseded
- archived


# ORG LEVEL GOVERNANCE POLICY PROFILE STATUS SET

- draft
- active
- restricted
- superseded
- archived


# OPTIMIZATION CYCLE CASE STATUS SET

- opened
- optimizing
- decided
- rejected
- archived


# RECOMMENDATION LANE ASSIGNMENT CASE STATUS SET

- opened
- assigning
- assigned
- rejected
- archived


# GOVERNANCE EXCEPTION CASE STATUS SET

- opened
- reviewing
- resolved
- rejected
- archived


# ORG DECISION SUMMARY STATUS SET

- drafted
- published
- superseded
- archived

