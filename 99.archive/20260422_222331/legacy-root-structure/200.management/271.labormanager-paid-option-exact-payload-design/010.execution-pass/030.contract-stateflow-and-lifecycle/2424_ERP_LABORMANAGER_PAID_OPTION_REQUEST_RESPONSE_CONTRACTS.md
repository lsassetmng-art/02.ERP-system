# ============================================================
# ERP LABORMANAGER PAID OPTION REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2424
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager_paid_option.request_response.contracts
component: labormanager-paid-option-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

labor_staff_profile write:
- employee_reference_code
- department_reference_code
- employment_type_code
- job_role_code
- hire_date
- supervisor_reference_code
- primary_work_location_reference_code
- labor_category_code

labor_attendance_case write:
- linked_labor_staff_profile_id
- attendance_date
- scheduled_start_at
- scheduled_end_at
- actual_start_at
- actual_end_at
- attendance_exception_code
- approval_state_code

labor_leave_request_case write:
- linked_labor_staff_profile_id
- leave_type_code
- requested_from
- requested_to
- leave_reason_code
- leave_duration_unit_code
- approval_state_code

labor_onboarding_case write:
- linked_labor_staff_profile_id
- onboarding_start_at
- onboarding_completion_at
- required_document_state_code
- required_training_state_code

labor_offboarding_case write:
- linked_labor_staff_profile_id
- separation_reason_code
- last_working_date
- asset_return_state_code
- knowledge_handover_state_code

labor_training_completion_case write:
- linked_labor_staff_profile_id
- training_program_code
- training_due_at
- training_completed_at
- certificate_state_code

labor_compliance_check_case write:
- linked_labor_staff_profile_id
- compliance_check_type_code
- compliance_check_period_code
- violation_flag
- remediation_required_flag
- checked_at
- checked_by_reference_code

