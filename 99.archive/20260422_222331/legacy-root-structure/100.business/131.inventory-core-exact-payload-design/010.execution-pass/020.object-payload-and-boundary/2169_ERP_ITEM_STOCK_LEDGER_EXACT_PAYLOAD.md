# ============================================================
# ERP ITEM STOCK LEDGER EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2169
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.item_stock_ledger.exact_payload
component: item-stock-ledger-exact-payload


# OBJECT

item_stock_ledger

Canonical payload:
- object_id
- company_id
- object_type = item_stock_ledger
- status
- stock_ledger_code
- item_reference_code
- location_reference_code
- lot_serial_reference_code
- on_hand_quantity
- reserved_quantity
- available_quantity
- unit_code
- valuation_basis_code
- last_movement_at
- created_at
- created_by
- updated_at
- updated_by

