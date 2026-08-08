# ============================================================
# ERP LABORMANAGER OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-763
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.object_family_set
component: labormanager-object-family-set


# PRIMARY OBJECT FAMILIES

- labor_staff_profile
- labor_employment_record
- labor_attendance_entry
- labor_leave_request
- labor_onboarding_case
- labor_offboarding_case
- labor_training_completion
- labor_compliance_check_result


# RULE

Staff profile is not employment record.
Attendance entry is not leave request.
Onboarding/offboarding case is not training completion.
Compliance result is not the same as employment state.

