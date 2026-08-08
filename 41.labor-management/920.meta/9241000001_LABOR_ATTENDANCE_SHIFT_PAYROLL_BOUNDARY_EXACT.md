# ============================================================
# LABOR MANAGEMENT ATTENDANCE / SHIFT / PAYROLL BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 41.labor-management
related_modules:
- 40.human-resources
- 42.payroll
- 50.approval
- 51.audit
- 60.business-intelligence

purpose:
Define labor management truth for shift, attendance, leave, overtime, and
approved work results, including exact handoff to payroll.

canonical_role:
- attendance / shift / leave / overtime / work result truth

shift_axis_rule:
- shift linkage is centered on 41.labor-management

# ============================================================
# 1. CORE LABOR OBJECTS
# ============================================================

core_objects:
- labor_worker_profile_intake
- labor_work_calendar
- labor_shift_plan
- labor_shift_assignment
- labor_shift_change
- labor_clock_event
- labor_attendance_record
- labor_break_record
- labor_leave_request
- labor_leave_usage
- labor_overtime_request
- labor_overtime_result
- labor_absence_lateness_early_leave
- labor_correction_request
- labor_approved_work_result
- labor_to_payroll_time_pay_basis

# ============================================================
# 2. HR PROFILE INTAKE
# ============================================================

accepted_input_object:
- hr_to_labor_worker_profile_snapshot

acceptance_requires:
- source_module = 40.human-resources
- target_module = 41.labor-management
- worker_id present
- employment_status active or otherwise labor-trackable
- labor_tracking_required_flag declared
- effective dates valid
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- WORKER_UNRESOLVABLE
- EMPLOYMENT_STATUS_NOT_TRACKABLE
- EFFECTIVE_DATE_INVALID
- LABOR_TRACKING_FLAG_MISSING
- MISSING_LINEAGE
- DUPLICATE_OR_SUPERSEDED_SNAPSHOT

rules:
- labor consumes HR profile snapshot
- labor does not own worker master
- HR correction requires new snapshot

# ============================================================
# 3. SHIFT PLAN / SHIFT ASSIGNMENT
# ============================================================

object_name:
- labor_shift_plan

required_fields:
- shift_plan_id
- company_id
- planning_period_start
- planning_period_end
- department_id_or_location_id_or_null
- shift_plan_status
- created_at
- created_by
- approved_at_or_null
- approved_by_or_null
- lineage_reference

allowed_shift_plan_status:
- draft
- review_pending
- approved
- published
- revised
- cancelled
- superseded

object_name:
- labor_shift_assignment

required_fields:
- shift_assignment_id
- company_id
- shift_plan_id
- worker_id
- work_date
- scheduled_start_at
- scheduled_end_at
- break_rule_reference_or_null
- work_location_id_or_null
- assignment_status
- created_at
- lineage_reference

allowed_assignment_status:
- draft
- assigned
- published
- changed
- swapped
- cancelled
- completed
- no_show
- superseded

rules:
- shift plan and assignment belong to 41
- HR provides eligibility and assignment basis
- payroll consumes approved shift/attendance result where relevant
- shift assignment is not attendance actual

# ============================================================
# 4. CLOCK EVENT / ATTENDANCE RECORD
# ============================================================

object_name:
- labor_clock_event

required_fields:
- clock_event_id
- company_id
- worker_id
- event_type
- event_at
- event_source
- location_reference_or_null
- device_reference_or_null
- correction_of_event_id_or_null
- event_status
- recorded_at
- lineage_reference

event_type_examples:
- clock_in
- clock_out
- break_start
- break_end
- manual_adjustment

allowed_event_status:
- recorded
- corrected
- rejected
- superseded

object_name:
- labor_attendance_record

required_fields:
- attendance_record_id
- company_id
- worker_id
- work_date
- shift_assignment_id_or_null
- scheduled_start_at_or_null
- scheduled_end_at_or_null
- actual_start_at_or_null
- actual_end_at_or_null
- actual_work_minutes
- break_minutes
- late_minutes
- early_leave_minutes
- absence_flag
- attendance_status
- approval_reference_or_null
- correction_reference_or_null
- lineage_reference

allowed_attendance_status:
- draft
- calculated
- correction_pending
- approval_pending
- approved
- rejected
- locked
- superseded

rules:
- attendance record is labor truth
- approved attendance may feed payroll
- locked attendance cannot be edited in place
- correction requires correction request / successor record

# ============================================================
# 5. LEAVE / OVERTIME
# ============================================================

object_name:
- labor_leave_request

required_fields:
- leave_request_id
- company_id
- worker_id
- leave_type
- leave_start_at
- leave_end_at
- requested_minutes_or_days
- request_status
- approval_reference_or_null
- created_at
- lineage_reference

allowed_request_status:
- draft
- submitted
- approval_pending
- approved
- rejected
- cancelled
- superseded

object_name:
- labor_leave_usage

required_fields:
- leave_usage_id
- company_id
- worker_id
- leave_request_id_or_null
- leave_type
- usage_period_start
- usage_period_end
- used_minutes_or_days
- usage_status
- attendance_record_reference_or_null
- lineage_reference

allowed_usage_status:
- planned
- used
- corrected
- cancelled
- superseded

object_name:
- labor_overtime_request

required_fields:
- overtime_request_id
- company_id
- worker_id
- work_date
- requested_overtime_minutes
- reason
- request_status
- approval_reference_or_null
- created_at
- lineage_reference

object_name:
- labor_overtime_result

required_fields:
- overtime_result_id
- company_id
- worker_id
- work_date
- approved_overtime_minutes_or_null
- actual_overtime_minutes
- payroll_eligible_overtime_minutes
- result_status
- attendance_record_reference
- approval_reference_or_null
- lineage_reference

allowed_overtime_status:
- draft
- submitted
- approval_pending
- approved
- rejected
- used_in_payroll
- corrected
- superseded

rules:
- leave and overtime truth belong to 41
- payroll consumes approved payroll-eligible results
- payroll does not approve or change labor result directly

# ============================================================
# 6. APPROVED WORK RESULT
# ============================================================

object_name:
- labor_approved_work_result

meaning:
- approved labor result package for a worker and period

required_fields:
- approved_work_result_id
- company_id
- worker_id
- labor_period_start
- labor_period_end
- attendance_record_set
- leave_usage_set
- overtime_result_set
- absence_lateness_summary
- total_regular_minutes
- total_overtime_minutes
- total_night_minutes_or_null
- total_holiday_minutes_or_null
- payroll_eligibility_status
- approval_reference
- locked_at_or_null
- lineage_reference

allowed_payroll_eligibility_status:
- not_ready
- ready_for_payroll
- sent_to_payroll
- accepted_by_payroll
- rejected_by_payroll
- corrected
- superseded

rules:
- approved work result is labor truth
- payroll basis handoff uses approved work result
- change after payroll acceptance requires correction/recalculation workflow

# ============================================================
# 7. LABOR TO PAYROLL TIME PAY BASIS
# ============================================================

handoff_object_name:
- labor_to_payroll_time_pay_basis

meaning:
- approved time/labor basis for payroll calculation

required_fields:
- time_pay_basis_id
- company_id
- source_module
- target_module
- payroll_period_start
- payroll_period_end
- worker_id
- approved_work_result_reference
- regular_minutes
- overtime_minutes
- night_minutes_or_null
- holiday_minutes_or_null
- leave_paid_minutes_or_days_or_null
- absence_unpaid_minutes_or_days_or_null
- lateness_early_leave_minutes_or_null
- payroll_eligible_flag
- handoff_status
- created_at
- created_by
- lineage_reference

allowed_handoff_status:
- building
- validation_pending
- handoff_ready
- sent_to_payroll
- accepted_by_payroll
- rejected_by_payroll
- corrected
- superseded
- cancelled

rules:
- source_module must be 41.labor-management
- target_module must be 42.payroll
- only handoff_ready may be accepted by payroll
- payroll may calculate from basis
- payroll may not rewrite labor attendance result

# ============================================================
# 8. PAYROLL ACCEPTANCE / REJECTION
# ============================================================

payroll_acceptance_requires:
- worker_id present
- payroll period valid
- approved work result present
- approval reference present
- payroll_eligible_flag declared
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- WORKER_UNRESOLVABLE
- PERIOD_MISMATCH
- APPROVAL_MISSING
- WORK_RESULT_NOT_APPROVED
- PAYROLL_ELIGIBILITY_INVALID
- MISSING_LINEAGE
- DUPLICATE_OR_SUPERSEDED_BASIS

rules:
- rejection does not delete labor result
- labor may issue corrected successor basis
- payroll may not patch labor result directly

# ============================================================
# 9. OUTPUT TO BI / AUDIT / APPROVAL
# ============================================================

BI_consumable_outputs:
- shift plan snapshot
- shift assignment snapshot
- attendance result snapshot
- leave usage snapshot
- overtime result snapshot
- payroll time basis snapshot

approval_rules:
- 50.approval may approve shift/leave/overtime/corrections
- approval does not replace labor source object

audit_rules:
- 51.audit may audit attendance / shift / overtime controls
- audit finding does not directly mutate labor result

# ============================================================
# 10. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- payroll directly editing attendance record
- HR department change directly rewriting past attendance result
- shift plan treated as actual attendance
- leave request treated as leave usage without approval/use workflow
- overtime request treated as overtime result without result approval
- BI dashboard correcting attendance
- audit finding changing labor record directly

# ============================================================
# 11. DECISION TEST
# ============================================================

decision_test:
- If it is shift / attendance / leave / overtime / work result, 41 owns it.
- If it is employee master or assignment, 40 owns it.
- If it is payroll calculation, 42 owns it.

# ============================================================
# 12. COMPLETION STATE
# ============================================================

completion_state:
- labor management exact design fixed
- shift axis fixed to 41
- attendance / leave / overtime ownership fixed
- labor to payroll time basis handoff fixed
- payroll mutation shortcuts forbidden

# ============================================================
