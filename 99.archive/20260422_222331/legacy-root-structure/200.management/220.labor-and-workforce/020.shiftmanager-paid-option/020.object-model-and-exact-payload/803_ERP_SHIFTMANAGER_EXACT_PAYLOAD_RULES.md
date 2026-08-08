# ============================================================
# ERP SHIFTMANAGER EXACT PAYLOAD RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-803
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.exact_payload.rules
component: shiftmanager-exact-payload-rules


# COMMON RULES

Every ShiftManager object should carry at minimum:
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
- plan_status_code
- preference_status_code
- assignment_status_code
- swap_status_code
- publication_status_code

