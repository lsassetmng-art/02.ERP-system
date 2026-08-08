# ============================================================
# ERP LABOR ATTENDANCE AND LEAVE EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1643
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labor.attendance_and_leave.exact_payload
component: labor-attendance-and-leave-exact-payload


# OBJECT 1

labor_attendance_record

Canonical payload:
- object_id
- company_id
- object_type = labor_attendance_record
- status
- attendance_record_code
- attendance_status_code
- staff_profile_id
- work_date
- scheduled_shift_reference_code
- actual_clock_in_at
- actual_clock_out_at
- attendance_exception_code
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

labor_leave_request

Canonical payload:
- object_id
- company_id
- object_type = labor_leave_request
- status
- leave_request_code
- leave_status_code
- staff_profile_id
- leave_type_code
- requested_start_date
- requested_end_date
- requested_leave_quantity
- leave_reason_code
- created_at
- created_by
- updated_at
- updated_by

