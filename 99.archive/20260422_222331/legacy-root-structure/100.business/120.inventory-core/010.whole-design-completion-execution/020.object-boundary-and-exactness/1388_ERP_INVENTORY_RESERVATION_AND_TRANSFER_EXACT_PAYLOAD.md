# ============================================================
# ERP INVENTORY RESERVATION AND TRANSFER EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1388
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.reservation_and_transfer.exact_payload
component: inventory-reservation-and-transfer-exact-payload


# OBJECT 1

inventory_reservation

Canonical payload:
- object_id
- company_id
- object_type = inventory_reservation
- status
- reservation_code
- item_reference_code
- source_stock_record_id
- reservation_status_code
- reserved_quantity
- reservation_basis_code
- linked_sales_order_line_id
- linked_manufacturing_reference_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

inventory_transfer_request

Canonical payload:
- object_id
- company_id
- object_type = inventory_transfer_request
- status
- transfer_request_code
- item_reference_code
- origin_site_reference_code
- destination_site_reference_code
- transfer_status_code
- requested_quantity
- requested_ship_date
- transfer_basis_code
- created_at
- created_by
- updated_at
- updated_by

