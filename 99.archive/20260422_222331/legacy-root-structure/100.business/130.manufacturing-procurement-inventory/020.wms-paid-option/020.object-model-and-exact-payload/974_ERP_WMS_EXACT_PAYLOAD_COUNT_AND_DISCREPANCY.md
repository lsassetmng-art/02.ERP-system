# ============================================================
# ERP WMS EXACT PAYLOAD COUNT AND DISCREPANCY
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-974
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.exact_payload.count_and_discrepancy
component: wms-exact-payload-count-and-discrepancy


# OBJECT 1

wms_count_session

Canonical payload:
- object_id
- company_id
- object_type = wms_count_session
- status
- count_session_code
- warehouse_id
- count_scope_code
- count_status_code
- scheduled_count_date
- actual_count_date
- counted_item_count
- counted_quantity_total
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

wms_discrepancy_record

Canonical payload:
- object_id
- company_id
- object_type = wms_discrepancy_record
- status
- linked_count_session_id
- warehouse_id
- location_id
- item_reference_code
- lot_id
- discrepancy_status_code
- system_quantity
- counted_quantity
- discrepancy_quantity
- discrepancy_reason_code
- resolved_at
- resolved_by
- created_at
- created_by
- updated_at
- updated_by


# RULE

Count session is the counting event container.
Discrepancy record is an item-level difference outcome from that count.

