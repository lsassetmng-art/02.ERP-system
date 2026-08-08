# ============================================================
# ERP SALES PURCHASING MANUFACTURING TO INVENTORY HANDOFF RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1399
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_purchasing_manufacturing_to_inventory.handoff_rule
component: sales-purchasing-manufacturing-to-inventory-handoff-rule


# RULE

Sales, purchasing, and manufacturing may hand off:
- outbound demand context
- inbound receipt expectation context
- component consumption context
- finished goods output context

Inventory core creates or updates owned truths:
- reservation meaning
- stock meaning
- transfer request meaning
- count reconciliation meaning

