# ============================================================
# ERP INVENTORY STOCK RECORD EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1387
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.stock_record.exact_payload
component: inventory-stock-record-exact-payload


# OBJECT

inventory_stock_record

Canonical payload:
- object_id
- company_id
- object_type = inventory_stock_record
- status
- stock_record_code
- item_reference_code
- site_reference_code
- warehouse_reference_code
- inventory_status_code
- on_hand_quantity
- reserved_quantity
- available_quantity
- unit_of_measure_code
- valuation_reference_code
- created_at
- created_by
- updated_at
- updated_by

