# ============================================================
# ERP SALES INVENTORY ACCOUNTING LINKAGE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1221
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sales_inventory_accounting.linkage_rule
component: sales-inventory-accounting-linkage-rule


# RULE

Sales, inventory, and accounting should be read as a linked business-core chain.

Representative linkage families:
- sales fulfillment impact on inventory
- sales recognition or billing impact on accounting
- inventory state and valuation impact on accounting

# CONSEQUENCE

These modules must not be completed in isolation
without their cross-module linkage semantics.

