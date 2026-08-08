# ============================================================
# ERP SFA PAID OPTION LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2385
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sfa_paid_option.lifecycle_and_statusflow.rule
component: sfa-paid-option-lifecycle-and-statusflow-rule


# SALES LEAD STATUS SET

- new
- qualified
- disqualified
- converted
- archived


# SALES OPPORTUNITY STATUS SET

- open
- in_progress
- committed
- won
- lost
- archived


# STAGE PROGRESSION STATUS SET

- drafted
- progressed
- blocked
- reversed
- archived


# FORECAST CASE STATUS SET

- draft
- submitted
- reviewed
- finalized
- archived


# NEXT ACTION TASK STATUS SET

- open
- in_progress
- completed
- canceled
- archived

