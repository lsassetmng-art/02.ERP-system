# ============================================================
# ERP INVENTORY RECEIPT AND SHIPMENT PROGRESSION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2181
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.receipt_and_shipment_progression.rule
component: inventory-receipt-and-shipment-progression-rule


# RULE

Inventory may progress receipt and shipment movements
from released to completed states.

Progression should preserve:
- originating upstream reference
- actual movement quantity
- source and destination locations
- completion timestamp
- reversal visibility if needed

