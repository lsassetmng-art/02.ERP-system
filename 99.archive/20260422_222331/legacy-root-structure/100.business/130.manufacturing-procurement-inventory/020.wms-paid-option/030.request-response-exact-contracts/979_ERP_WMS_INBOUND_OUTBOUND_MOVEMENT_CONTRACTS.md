# ============================================================
# ERP WMS INBOUND OUTBOUND MOVEMENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-979
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.inbound_outbound_movement_contracts
component: wms-inbound-outbound-movement-contracts


# INBOUND RECEIPT WRITE REQUEST BODY

- warehouse_id
- supplier_reference_code
- expected_receipt_date
- actual_receipt_date
- received_item_count
- received_quantity_total


# OUTBOUND PICK WRITE REQUEST BODY

- warehouse_id
- source_location_id
- item_reference_code
- lot_id
- required_ship_date
- picked_quantity
- packed_quantity
- dispatch_reference_code


# STOCK MOVEMENT WRITE REQUEST BODY

- warehouse_id
- from_location_id
- to_location_id
- item_reference_code
- lot_id
- moved_quantity
- movement_reason_code


# RULE

Inbound receipt, outbound pick, and stock movement
must remain separate contracts.

