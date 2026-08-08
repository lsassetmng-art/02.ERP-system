# ============================================================
# ERP SALES LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2116
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.lifecycle_and_statusflow.rule
component: sales-lifecycle-and-statusflow-rule


# QUOTE STATUS SET

- draft
- issued
- accepted
- expired
- canceled
- archived


# ORDER STATUS SET

- draft
- pending_approval
- approved
- active
- completed
- canceled
- archived


# FULFILLMENT INSTRUCTION STATUS SET

- draft
- released
- partially_fulfilled
- fulfilled
- blocked
- archived


# INVOICE REQUEST STATUS SET

- draft
- requested
- handed_off
- completed
- canceled
- archived


# CORRECTION CASE STATUS SET

- open
- under_review
- approved
- applied
- rejected
- archived

