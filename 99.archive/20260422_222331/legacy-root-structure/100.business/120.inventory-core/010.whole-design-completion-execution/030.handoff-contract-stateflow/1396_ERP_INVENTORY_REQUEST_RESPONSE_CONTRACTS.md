# ============================================================
# ERP INVENTORY REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1396
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.request_response.contracts
component: inventory-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

inventory_reservation write:
- item_reference_code
- source_stock_record_id
- reserved_quantity
- reservation_basis_code
- linked_sales_order_line_id
- linked_manufacturing_reference_code

inventory_transfer_request write:
- item_reference_code
- origin_site_reference_code
- destination_site_reference_code
- requested_quantity
- requested_ship_date
- transfer_basis_code

inventory_adjustment_request write:
- stock_record_id
- requested_adjustment_quantity
- adjustment_reason_code
- requested_effective_date

inventory_count_reconciliation write:
- stock_record_id
- counted_quantity
- system_quantity
- reconciliation_reason_code
- counted_at

