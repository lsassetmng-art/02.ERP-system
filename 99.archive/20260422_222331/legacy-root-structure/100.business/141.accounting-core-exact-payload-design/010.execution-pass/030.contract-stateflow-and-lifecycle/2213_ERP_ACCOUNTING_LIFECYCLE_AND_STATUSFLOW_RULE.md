# ============================================================
# ERP ACCOUNTING LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2213
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.lifecycle_and_statusflow.rule
component: accounting-lifecycle-and-statusflow-rule


# DOCUMENT DRAFT STATUS SET

- draft
- pending_approval
- approved
- posted_ready
- canceled
- archived


# JOURNAL BATCH STATUS SET

- draft
- validated
- posted
- reversed
- archived


# RECEIVABLE_PAYABLE POSITION STATUS SET

- open
- partially_settled
- settled
- overdue
- written_off
- archived


# CLOSE CYCLE STATUS SET

- open
- in_review
- soft_closed
- hard_closed
- reopened
- archived


# CORRECTION CASE STATUS SET

- open
- under_review
- approved
- applied
- rejected
- archived

