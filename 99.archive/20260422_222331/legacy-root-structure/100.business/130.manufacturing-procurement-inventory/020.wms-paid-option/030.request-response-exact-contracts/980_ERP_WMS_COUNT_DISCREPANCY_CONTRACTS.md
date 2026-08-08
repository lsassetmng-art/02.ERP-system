# ============================================================
# ERP WMS COUNT DISCREPANCY CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-980
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.count_discrepancy_contracts
component: wms-count-discrepancy-contracts


# COUNT SESSION WRITE REQUEST BODY

- warehouse_id
- count_scope_code
- scheduled_count_date
- actual_count_date
- counted_item_count
- counted_quantity_total


# DISCREPANCY WRITE REQUEST BODY

- linked_count_session_id
- warehouse_id
- location_id
- item_reference_code
- lot_id
- system_quantity
- counted_quantity
- discrepancy_quantity
- discrepancy_reason_code


# RULE

Count session closure and discrepancy resolution
must remain distinct controlled actions.

