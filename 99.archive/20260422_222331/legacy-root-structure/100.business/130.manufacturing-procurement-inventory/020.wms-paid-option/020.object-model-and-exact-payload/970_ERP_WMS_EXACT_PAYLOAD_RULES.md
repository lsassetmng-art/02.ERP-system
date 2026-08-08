# ============================================================
# ERP WMS EXACT PAYLOAD RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-970
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.exact_payload.rules
component: wms-exact-payload-rules


# COMMON RULES

Every WMS object should carry at minimum:
- object_id
- company_id
- object_type
- status
- created_at
- created_by
- updated_at
- updated_by

Soft-removable families should also carry:
- archived_at
- archived_by
- archive_reason

Derived display fields must not replace:
- warehouse_status_code
- location_status_code
- lot_status_code
- receipt_status_code
- pick_status_code
- movement_status_code
- count_status_code
- discrepancy_status_code

