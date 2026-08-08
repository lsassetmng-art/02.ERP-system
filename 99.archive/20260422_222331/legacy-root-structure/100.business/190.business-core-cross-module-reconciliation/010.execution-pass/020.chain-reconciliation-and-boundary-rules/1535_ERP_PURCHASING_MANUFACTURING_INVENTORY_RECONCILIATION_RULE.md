# ============================================================
# ERP PURCHASING MANUFACTURING INVENTORY RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1535
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchasing_manufacturing_inventory.reconciliation_rule
component: purchasing-manufacturing-inventory-reconciliation-rule


# RULE

Purchasing owns:
- external sourcing commitment truth

Manufacturing owns:
- production execution truth

Inventory owns:
- stock-side interpretation truth

# CONSEQUENCE

The chain must preserve:
- purchasing-created inbound commitment
- manufacturing-created production need and execution meaning
- inventory-created stock-side realization meaning

