# ============================================================
# ERP SALES INVENTORY ACCOUNTING RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1534
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_inventory_accounting.reconciliation_rule
component: sales-inventory-accounting-reconciliation-rule


# RULE

Sales owns:
- quote and order truth
- billing instruction truth
- return request truth

Inventory owns:
- reservation and stock-side meaning
- adjustment and reconciliation meaning

Accounting owns:
- posting and close-cycle truth

# CONSEQUENCE

The chain must preserve:
- sales-created commercial demand
- inventory-created stock meaning
- accounting-created posting meaning

No node in this chain may silently overwrite another node's truth.

