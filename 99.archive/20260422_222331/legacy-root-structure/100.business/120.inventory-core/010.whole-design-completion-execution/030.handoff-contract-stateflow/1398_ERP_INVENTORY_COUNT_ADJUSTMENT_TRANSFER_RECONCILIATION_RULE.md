# ============================================================
# ERP INVENTORY COUNT ADJUSTMENT TRANSFER RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1398
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.count_adjustment_transfer_reconciliation.rule
component: inventory-count-adjustment-transfer-reconciliation-rule


# RULE

Count reconciliation, adjustment, and transfer semantics must remain distinct.

Representative distinctions:
- reconciled count is not posted adjustment
- approved transfer request is not warehouse move completion
- released reservation is not stock deduction

# CONSEQUENCE

Every reconciliation-class or adjustment-class action must preserve:
- original inventory object reference
- reason
- actor
- timestamp
- downstream handoff visibility

