# ============================================================
# ERP SALES TO INVENTORY ACCOUNTING_HANDOFF_RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1363
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_to_inventory_accounting.handoff_rule
component: sales-to-inventory-accounting-handoff-rule


# RULE

Sales core may hand off:
- fulfillment instruction to inventory/warehouse side
- billing instruction to accounting side
- return request to inventory/warehouse and accounting side

# CONSEQUENCE

Downstream modules create their own new truths.

Sales handoff does not itself equal:
- stock deduction truth
- warehouse execution truth
- journal posting truth

