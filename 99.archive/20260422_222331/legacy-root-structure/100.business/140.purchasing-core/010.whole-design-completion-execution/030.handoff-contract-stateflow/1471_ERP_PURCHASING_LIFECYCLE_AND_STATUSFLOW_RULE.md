# ============================================================
# ERP PURCHASING LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1471
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchasing.lifecycle_and_statusflow.rule
component: purchasing-lifecycle-and-statusflow-rule


# REQUEST STATUS SET

- draft
- submitted
- approved
- rejected
- archived


# ORDER STATUS SET

- draft
- confirmed
- released
- partially_received
- received
- canceled
- archived


# RECEIPT EXPECTATION STATUS SET

- open
- released
- partially_received
- completed
- canceled
- archived


# SUPPLIER RETURN REQUEST STATUS SET

- open
- approved
- rejected
- shipped
- closed
- archived

