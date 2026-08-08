# ============================================================
# ERP LABOR ONBOARDING OFFBOARDING TRAINING EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2415
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labor_onboarding_offboarding_training.exact_payload
component: labor-onboarding-offboarding-training-exact-payload


# OBJECT 1

labor_onboarding_case

Canonical payload:
- object_id
- company_id
- object_type = labor_onboarding_case
- status
- labor_onboarding_case_code
- onboarding_status_code
- linked_labor_staff_profile_id
- onboarding_start_at
- onboarding_completion_at
- required_document_state_code
- required_training_state_code
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
- labor_offboarding_case_code
- offboarding_status_code
- linked_labor_staff_profile_id
- separation_reason_code
- last_working_date
- asset_return_state_code
- knowledge_handover_state_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 3

labor_training_completion_case

Canonical payload:
- object_id
- company_id
- object_type = labor_training_completion_case
- status
- labor_training_completion_case_code
- training_completion_status_code
- linked_labor_staff_profile_id
- training_program_code
- training_due_at
- training_completed_at
- certificate_state_code
- created_at
- created_by
- updated_at
- updated_by

