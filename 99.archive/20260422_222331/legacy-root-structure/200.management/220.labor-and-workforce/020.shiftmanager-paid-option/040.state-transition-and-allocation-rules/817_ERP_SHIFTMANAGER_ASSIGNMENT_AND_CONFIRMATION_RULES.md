# ============================================================
# ERP SHIFTMANAGER ASSIGNMENT AND CONFIRMATION RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-817
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.assignment_and_confirmation.rules
component: shiftmanager-assignment-and-confirmation-rules


# ASSIGNMENT STATUS SET

- proposed
- assigned
- confirmed
- declined
- canceled
- completed


# ALLOWED TRANSITIONS

- proposed -> assigned
- assigned -> confirmed
- assigned -> declined
- assigned -> canceled
- confirmed -> completed
- declined -> assigned
- proposed -> canceled


# RULE

Confirmed does not equal attendance truth.
Completed may reflect planned completion state only,
not actual attendance verification.

