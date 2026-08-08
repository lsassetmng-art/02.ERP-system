# ============================================================
# ERP COMPANY WIDE MBO PAID OPTION LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2508
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo_paid_option.lifecycle_and_statusflow.rule
component: company-wide-mbo-paid-option-lifecycle-and-statusflow-rule


# OBJECTIVE REGISTRY STATUS SET

- draft
- active
- suspended
- closed
- archived


# OBJECTIVE ASSIGNMENT STATUS SET

- drafted
- assigned
- accepted
- reassigned
- canceled
- archived


# OBJECTIVE PROGRESS REVIEW STATUS SET

- open
- reviewed
- at_risk
- completed
- archived


# OBJECTIVE EVALUATION LINK STATUS SET

- pending
- linked
- superseded
- archived


# MBO CYCLE CLOSURE STATUS SET

- open
- in_review
- closed
- reopened
- archived

