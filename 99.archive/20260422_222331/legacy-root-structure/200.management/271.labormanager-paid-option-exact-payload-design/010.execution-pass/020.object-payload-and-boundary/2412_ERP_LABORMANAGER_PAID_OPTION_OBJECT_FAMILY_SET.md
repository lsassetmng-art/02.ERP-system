# ============================================================
# ERP LABORMANAGER PAID OPTION OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2412
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager_paid_option.object_family_set
component: labormanager-paid-option-object-family-set


# PRIMARY OBJECT FAMILIES

- labor_staff_profile
- labor_attendance_case
- labor_leave_request_case
- labor_onboarding_case
- labor_offboarding_case
- labor_training_completion_case
- labor_compliance_check_case

# RULE

Staff profile is not attendance case.
Attendance case is not leave request case.
Leave request case is not onboarding case.
Onboarding case is not offboarding case.
Offboarding case is not training completion case.
Training completion case is not compliance check case.

