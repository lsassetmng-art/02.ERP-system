# ============================================================
# ERP QUALITY LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3114
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.quality.lifecycle_and_statusflow.rule
component: quality-lifecycle-and-statusflow-rule


# RECOMMENDATION QUALITY SCORE STATUS SET

- draft
- scored
- reviewed
- accepted
- archived


# PROMOTION CRITERIA PROFILE STATUS SET

- draft
- active
- restricted
- superseded
- archived


# POLICY GATE PROFILE STATUS SET

- draft
- active
- restricted
- superseded
- archived


# PROMOTION EVALUATION CASE STATUS SET

- opened
- evaluating
- approved_for_gate
- rejected
- archived


# POLICY GATE DECISION CASE STATUS SET

- pending
- approved
- held
- rejected
- archived

