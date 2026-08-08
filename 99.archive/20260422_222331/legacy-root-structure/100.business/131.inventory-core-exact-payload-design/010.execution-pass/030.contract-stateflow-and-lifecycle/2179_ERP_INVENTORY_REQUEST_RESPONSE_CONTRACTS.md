# ============================================================
# ERP INVENTORY REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2179
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.request_response.contracts
component: inventory-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

item_stock_ledger write:
- item_reference_code
- location_reference_code
- lot_serial_reference_code
- on_hand_quantity
- reserved_quantity
- available_quantity
- valuation_basis_code

stock_movement_case write:
- movement_type_code
- linked_sales_fulfillment_instruction_id
- linked_receipt_expectation_id
- source_location_reference_code
- destination_location_reference_code
- movement_quantity
- movement_effective_at

allocation_reservation_case write:
- linked_sales_order_id
- linked_item_stock_ledger_id
- reserved_quantity
- reservation_basis_code
- reserved_until

count_adjustment_case write:
- linked_item_stock_ledger_id
- adjustment_reason_code
- counted_quantity
- book_quantity
- adjustment_effective_at

replenishment_signal write:
- linked_item_stock_ledger_id
- reorder_point_quantity
- suggested_replenishment_quantity
- signal_reason_code
- signal_generated_at

