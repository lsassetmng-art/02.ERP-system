# ============================================================
# ERP BUSINESS INVENTORY AND MANUFACTURING JUDGMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass judgment
for inventory and manufacturing business subdomains.

inventory_reading:
- inventory.stock_balance is the aggregate stock-state anchor
- inventory.stock_lot_balance is the lot-level stock-state anchor

manufacturing_reading:
- manufacturing.work_order is the work-order anchor
- manufacturing.manufacturing_execution is the execution anchor

important_link:
- manufacturing_execution links to work_order

conclusion:
Inventory and manufacturing are currently best modeled
as state-and-execution business layers rather than simple document chains.
