# ============================================================
# ERP COMPANY WIDE MBO LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1726
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo.lifecycle_and_statusflow.rule
component: company-wide-mbo-lifecycle-and-statusflow-rule


# MBO PROGRAM STATUS SET

- draft
- active
- frozen
- archived


# OBJECTIVE CASCADE STATUS SET

- planned
- cascaded
- acknowledged
- closed
- archived


# ASSIGNMENT RECORD STATUS SET

- open
- accepted
- in_progress
- completed
- canceled
- archived


# PROGRESS REVIEW STATUS SET

- open
- submitted
- reviewed
- closed
- archived


# EVALUATION SUPPORT CASE STATUS SET

- open
- prepared
- delivered
- closed
- archived

