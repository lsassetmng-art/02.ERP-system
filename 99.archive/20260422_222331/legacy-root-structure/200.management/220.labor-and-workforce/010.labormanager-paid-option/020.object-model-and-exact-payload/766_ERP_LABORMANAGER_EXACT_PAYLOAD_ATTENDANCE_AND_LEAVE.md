# ============================================================
# ERP LABORMANAGER EXACT PAYLOAD ATTENDANCE AND LEAVE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-766
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.exact_payload.attendance_and_leave
component: labormanager-exact-payload-attendance-and-leave


# OBJECT 1

labor_attendance_entry

Canonical payload:
- object_id
- company_id
- object_type = labor_attendance_entry
- status
- staff_profile_id
- work_date
- scheduled_start_at
- scheduled_end_at
- actual_start_at
- actual_end_at
- break_minutes
- attendance_status_code
- correction_required_flag
- correction_reason_code
- approved_by
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
- staff_profile_id
- leave_type_code
- leave_start_at
- leave_end_at
- leave_days_or_hours_value
- leave_status_code
- requested_reason
- approver_user_id
- approved_at
- rejected_at
- rejection_reason
- created_at
- created_by
- updated_at
- updated_by


# RULE

Attendance entry is not the same as leave request.
Leave approval must not silently rewrite attendance truth.

