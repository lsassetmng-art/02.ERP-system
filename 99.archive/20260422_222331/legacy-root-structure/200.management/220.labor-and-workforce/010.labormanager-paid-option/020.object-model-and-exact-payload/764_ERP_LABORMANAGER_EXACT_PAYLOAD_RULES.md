# ============================================================
# ERP LABORMANAGER EXACT PAYLOAD RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-764
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.exact_payload.rules
component: labormanager-exact-payload-rules


# COMMON RULES

Every LaborManager object should carry at minimum:
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
- employment_status_code
- attendance_status_code
- leave_status_code
- onboarding_status_code
- training_status_code
- compliance_result_code

