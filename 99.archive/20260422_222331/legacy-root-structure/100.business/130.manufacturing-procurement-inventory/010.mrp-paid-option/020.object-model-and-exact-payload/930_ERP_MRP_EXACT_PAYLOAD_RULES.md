# ============================================================
# ERP MRP EXACT PAYLOAD RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-930
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.exact_payload.rules
component: mrp-exact-payload-rules


# COMMON RULES

Every MRP object should carry at minimum:
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
- demand_status_code
- bom_status_code
- run_status_code
- planned_order_status_code
- recommendation_status_code
- exception_status_code

