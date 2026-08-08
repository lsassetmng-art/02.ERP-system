# ============================================================
# ERP INVENTORY WHOLE DESIGN EXECUTION POSITIONING
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1379
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory_whole_design_execution.positioning
component: inventory-whole-design-execution-positioning


# POSITIONING

Inventory core is the ERP stock-meaning layer.

It owns:
- inventory balance meaning
- allocation and reservation meaning
- inventory adjustment request meaning
- transfer request meaning
- count reconciliation meaning

Inventory core does not own:
- warehouse execution event truth
- commercial sales order truth
- journal and ledger truth
- production planning truth

