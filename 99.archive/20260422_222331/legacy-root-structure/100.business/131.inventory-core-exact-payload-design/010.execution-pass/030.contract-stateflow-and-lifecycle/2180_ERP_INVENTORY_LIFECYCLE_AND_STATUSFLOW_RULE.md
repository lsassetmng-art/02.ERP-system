# ============================================================
# ERP INVENTORY LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2180
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.lifecycle_and_statusflow.rule
component: inventory-lifecycle-and-statusflow-rule


# STOCK LEDGER STATUS SET

- active
- blocked
- closed
- archived


# STOCK MOVEMENT STATUS SET

- draft
- released
- in_transit
- completed
- reversed
- archived


# RESERVATION STATUS SET

- open
- allocated
- released
- expired
- archived


# COUNT ADJUSTMENT STATUS SET

- draft
- under_review
- approved
- applied
- rejected
- archived


# REPLENISHMENT SIGNAL STATUS SET

- open
- acknowledged
- converted
- dismissed
- archived

