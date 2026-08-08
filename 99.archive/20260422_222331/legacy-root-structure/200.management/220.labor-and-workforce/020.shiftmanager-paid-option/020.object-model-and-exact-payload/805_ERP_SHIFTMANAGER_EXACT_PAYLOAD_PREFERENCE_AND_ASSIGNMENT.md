# ============================================================
# ERP SHIFTMANAGER EXACT PAYLOAD PREFERENCE AND ASSIGNMENT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-805
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.exact_payload.preference_and_assignment
component: shiftmanager-exact-payload-preference-and-assignment


# OBJECT 1

shift_preference_submission

Canonical payload:
- object_id
- company_id
- object_type = shift_preference_submission
- status
- shift_plan_id
- staff_profile_id
- preference_status_code
- available_slot_set_summary
- unavailable_slot_set_summary
- preferred_slot_set_summary
- submitted_at
- withdrawn_at
- reviewed_by
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

shift_assignment

Canonical payload:
- object_id
- company_id
- object_type = shift_assignment
- status
- shift_plan_id
- staff_profile_id
- shift_date
- shift_slot_code
- assigned_start_at
- assigned_end_at
- assignment_status_code
- assigned_by
- confirmed_at
- declined_at
- related_swap_request_id
- created_at
- created_by
- updated_at
- updated_by


# RULE

Preference submission expresses availability/preference intent.
Assignment expresses actual roster decision.

