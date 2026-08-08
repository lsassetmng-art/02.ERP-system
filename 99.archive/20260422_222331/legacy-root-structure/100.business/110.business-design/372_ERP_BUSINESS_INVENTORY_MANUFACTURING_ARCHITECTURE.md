# ============================================================
# ERP BUSINESS INVENTORY MANUFACTURING ARCHITECTURE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass architecture
for inventory and manufacturing business subdomains.

inventory_objects:
- inventory.stock_balance
- inventory.stock_lot_balance

inventory_role_split:
- aggregate stock-state layer
- lot-level stock-state layer

manufacturing_objects:
- manufacturing.work_order
- manufacturing.manufacturing_execution

manufacturing_role_split:
- work-order anchor layer
- execution layer

important link:
- manufacturing_execution links to work_order

main_rule:
Inventory and manufacturing should be modeled
as state-and-execution architecture,
not only as document chains.

conclusion:
Inventory and manufacturing form the stateful operational side
of ERP business architecture.
