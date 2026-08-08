# ============================================================
# ERP SALES LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1360
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales.lifecycle_and_statusflow.rule
component: sales-lifecycle-and-statusflow-rule


# QUOTE STATUS SET

- draft
- issued
- accepted
- rejected
- expired
- archived


# ORDER STATUS SET

- draft
- confirmed
- released
- partially_fulfilled
- fulfilled
- canceled
- archived


# BILLING INSTRUCTION STATUS SET

- open
- released
- invoiced
- canceled
- archived


# RETURN REQUEST STATUS SET

- open
- approved
- rejected
- received
- closed
- archived

