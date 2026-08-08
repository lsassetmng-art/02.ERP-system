# ============================================================
# ERP LABORMANAGER PAID OPTION EXACT PAYLOAD CANONICAL SCOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2406
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager_paid_option_exact_payload.canonical_scope
component: labormanager-paid-option-exact-payload-canonical-scope


# IN SCOPE

- labor_staff_profile
- labor_attendance_case
- labor_leave_request_case
- labor_onboarding_case
- labor_offboarding_case
- labor_training_completion_case
- labor_compliance_check_case
- ShiftManager linkage visibility
- payroll linkage visibility
- management approval visibility

# OUT OF SCOPE FOR THIS PASS

- ShiftManager internal app workflow
- payroll engine internals
- Ai(robot) assignment or evaluation internals
- UI implementation source code

