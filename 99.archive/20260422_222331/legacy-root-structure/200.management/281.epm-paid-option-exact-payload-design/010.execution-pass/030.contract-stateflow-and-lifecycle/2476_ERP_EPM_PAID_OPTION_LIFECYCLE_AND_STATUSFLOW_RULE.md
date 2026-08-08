# ============================================================
# ERP EPM PAID OPTION LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2476
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm_paid_option.lifecycle_and_statusflow.rule
component: epm-paid-option-lifecycle-and-statusflow-rule


# PERFORMANCE PLAN STATUS SET

- draft
- proposed
- approved
- active
- closed
- archived


# BUDGET COORDINATION STATUS SET

- draft
- in_review
- aligned
- approved
- closed
- archived


# FORECAST COORDINATION STATUS SET

- draft
- submitted
- reviewed
- finalized
- archived


# VARIANCE SNAPSHOT STATUS SET

- draft
- finalized
- superseded
- archived


# DASHBOARD SNAPSHOT STATUS SET

- draft
- published
- superseded
- archived

