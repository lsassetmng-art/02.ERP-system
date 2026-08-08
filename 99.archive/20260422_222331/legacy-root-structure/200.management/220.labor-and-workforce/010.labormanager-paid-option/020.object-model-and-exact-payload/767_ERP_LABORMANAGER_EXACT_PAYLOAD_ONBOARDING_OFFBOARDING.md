# ============================================================
# ERP LABORMANAGER EXACT PAYLOAD ONBOARDING OFFBOARDING
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-767
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.exact_payload.onboarding_offboarding
component: labormanager-exact-payload-onboarding-offboarding


# OBJECT 1

labor_onboarding_case

Canonical payload:
- object_id
- company_id
- object_type = labor_onboarding_case
- status
- staff_profile_id
- onboarding_status_code
- planned_start_date
- actual_start_date
- checklist_completion_percent
- primary_owner_user_id
- missing_item_count
- compliance_hold_flag
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

labor_offboarding_case

Canonical payload:
- object_id
- company_id
- object_type = labor_offboarding_case
- status
- staff_profile_id
- offboarding_status_code
- planned_end_date
- actual_end_date
- checklist_completion_percent
- asset_return_completion_flag
- access_revocation_completion_flag
- primary_owner_user_id
- created_at
- created_by
- updated_at
- updated_by


# RULE

Offboarding and onboarding are governed cases,
not mere fields on staff profile.

