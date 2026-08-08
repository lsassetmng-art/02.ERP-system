# ============================================================
# ERP PURCHASE LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2148
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase.lifecycle_and_statusflow.rule
component: purchase-lifecycle-and-statusflow-rule


# REQUEST STATUS SET

- draft
- submitted
- approved
- rejected
- canceled
- archived


# ORDER STATUS SET

- draft
- pending_approval
- approved
- sent
- active
- completed
- canceled
- archived


# RECEIPT EXPECTATION STATUS SET

- draft
- released
- partially_received
- received
- blocked
- archived


# SUPPLIER INVOICE INTAKE STATUS SET

- draft
- received
- handed_off
- completed
- rejected
- archived


# CORRECTION CASE STATUS SET

- open
- under_review
- approved
- applied
- rejected
- archived

