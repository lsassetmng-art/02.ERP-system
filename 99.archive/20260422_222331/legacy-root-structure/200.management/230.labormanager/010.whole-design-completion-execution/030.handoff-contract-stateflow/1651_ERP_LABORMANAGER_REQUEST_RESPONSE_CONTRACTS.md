# ============================================================
# ERP LABORMANAGER REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1651
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager.request_response.contracts
component: labormanager-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

labor_staff_profile write:
- employee_reference_code
- department_reference_code
- position_reference_code
- hire_date
- contract_type_code
- employment_type_code
- primary_work_location_code

labor_attendance_record write:
- staff_profile_id
- work_date
- scheduled_shift_reference_code
- actual_clock_in_at
- actual_clock_out_at
- attendance_exception_code

labor_leave_request write:
- staff_profile_id
- leave_type_code
- requested_start_date
- requested_end_date
- requested_leave_quantity
- leave_reason_code

labor_employment_lifecycle_case write:
- staff_profile_id
- lifecycle_case_type_code
- effective_date
- lifecycle_reason_code
- linked_manager_reference_code

labor_compliance_case write:
- staff_profile_id
- compliance_category_code
- detected_at
- compliance_reason_code
- linked_source_reference_code

