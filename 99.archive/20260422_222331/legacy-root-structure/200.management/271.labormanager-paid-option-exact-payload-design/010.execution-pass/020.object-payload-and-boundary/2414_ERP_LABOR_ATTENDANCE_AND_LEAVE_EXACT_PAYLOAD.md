# ============================================================
# ERP LABOR ATTENDANCE AND LEAVE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2414
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labor_attendance_and_leave.exact_payload
component: labor-attendance-and-leave-exact-payload


# OBJECT 1

labor_attendance_case

Canonical payload:
- object_id
- company_id
- object_type = labor_attendance_case
- status
- labor_attendance_case_code
- attendance_status_code
- linked_labor_staff_profile_id
- attendance_date
- scheduled_start_at
- scheduled_end_at
- actual_start_at
- actual_end_at
- attendance_exception_code
- approval_state_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

labor_leave_request_case

Canonical payload:
- object_id
- company_id
- object_type = labor_leave_request_case
- status
- labor_leave_request_case_code
- leave_request_status_code
- linked_labor_staff_profile_id
- leave_type_code
- requested_from
- requested_to
- leave_reason_code
- leave_duration_unit_code
- approval_state_code
- created_at
- created_by
- updated_at
- updated_by

