# ============================================================
# ERP ACCOUNTING LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1433
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.lifecycle_and_statusflow.rule
component: accounting-lifecycle-and-statusflow-rule


# JOURNAL ENTRY STATUS SET

- draft
- posted
- corrected
- reversed
- archived


# LEDGER POSTING STATUS SET

- open
- posted
- adjusted
- archived


# CORRECTION REQUEST STATUS SET

- open
- approved
- posted
- rejected
- archived


# CLOSE CYCLE STATUS SET

- open
- in_review
- closed
- reopened
- archived

