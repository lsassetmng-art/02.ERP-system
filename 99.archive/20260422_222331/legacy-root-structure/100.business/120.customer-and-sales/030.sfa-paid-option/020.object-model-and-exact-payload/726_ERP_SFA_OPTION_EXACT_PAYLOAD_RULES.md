# ============================================================
# ERP SFA OPTION EXACT PAYLOAD RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-726
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.exact_payload.rules
component: sfa-option-exact-payload-rules


# COMMON RULES

Every SFA object should carry at minimum:
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
- stage_code
- forecast_bucket_code
- close_target_date
- owner_user_id
- linked_account_reference_id

