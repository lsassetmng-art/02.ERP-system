# ============================================================
# ERP INVENTORY LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1397
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.lifecycle_and_statusflow.rule
component: inventory-lifecycle-and-statusflow-rule


# STOCK RECORD STATUS SET

- active
- blocked
- quarantined
- archived


# RESERVATION STATUS SET

- open
- allocated
- released
- canceled
- archived


# TRANSFER REQUEST STATUS SET

- open
- approved
- released
- completed
- canceled
- archived


# ADJUSTMENT REQUEST STATUS SET

- open
- approved
- posted
- rejected
- archived


# COUNT RECONCILIATION STATUS SET

- open
- reviewed
- reconciled
- escalated
- archived

