# ============================================================
# ERP LABORMANAGER PAID OPTION LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2425
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager_paid_option.lifecycle_and_statusflow.rule
component: labormanager-paid-option-lifecycle-and-statusflow-rule


# STAFF PROFILE STATUS SET

- active
- suspended
- terminated
- archived


# ATTENDANCE CASE STATUS SET

- draft
- submitted
- approved
- corrected
- rejected
- archived


# LEAVE REQUEST STATUS SET

- draft
- submitted
- approved
- denied
- canceled
- archived


# ONBOARDING CASE STATUS SET

- open
- in_progress
- completed
- blocked
- archived


# OFFBOARDING CASE STATUS SET

- open
- in_progress
- completed
- canceled
- archived


# TRAINING COMPLETION STATUS SET

- assigned
- in_progress
- completed
- overdue
- archived


# COMPLIANCE CHECK STATUS SET

- scheduled
- open
- reviewed
- remediating
- closed
- archived

