# ============================================================
# ERP COMPANY WIDE MBO EXACT PAYLOAD RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-889
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.exact_payload.rules
component: company-wide-mbo-exact-payload-rules


# COMMON RULES

Every company_wide_mbo object should carry at minimum:
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
- alignment_status_code
- checkin_status_code
- review_sheet_status_code
- evaluation_support_status_code

