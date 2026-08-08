# ============================================================
# ERP PORTFOLIO LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3146
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.portfolio.lifecycle_and_statusflow.rule
component: portfolio-lifecycle-and-statusflow-rule


# RECOMMENDATION PORTFOLIO PROFILE STATUS SET

- draft
- active
- restricted
- superseded
- archived


# MULTI PROFILE ARBITRATION CASE STATUS SET

- opened
- arbitrating
- decided
- rejected
- archived


# ENTERPRISE ROLLOUT POLICY PROFILE STATUS SET

- draft
- active
- restricted
- superseded
- archived


# PORTFOLIO EXPOSURE STRATEGY STATUS SET

- draft
- active
- restricted
- archived


# TENANT OVERRIDE POLICY CASE STATUS SET

- requested
- approved
- rejected
- expired
- archived


# ARBITRATION EVIDENCE SUMMARY STATUS SET

- generated
- reviewed
- accepted
- contradicted
- archived

