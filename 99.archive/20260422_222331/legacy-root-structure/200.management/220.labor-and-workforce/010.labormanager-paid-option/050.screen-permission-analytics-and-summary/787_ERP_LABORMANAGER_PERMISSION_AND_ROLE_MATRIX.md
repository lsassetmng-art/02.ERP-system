# ============================================================
# ERP LABORMANAGER PERMISSION AND ROLE MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-787
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.permission_and_role_matrix
component: labormanager-permission-and-role-matrix


# RECOMMENDED ROLES

- labormanager_option_admin
- labor_manager
- labor_operator
- attendance_approver
- compliance_reviewer
- readonly_labor_analyst


# RECOMMENDED CAPABILITY FAMILIES

- labor_staff_read
- labor_staff_write
- labor_attendance_read
- labor_attendance_write
- labor_attendance_correction_approve
- labor_leave_read
- labor_leave_write
- labor_leave_approve
- labor_onboarding_write
- labor_offboarding_write
- labor_training_write
- labor_compliance_review
- labor_export
- labor_audit_read


# RULE

Attendance correction approval and leave approval
must not be granted by ordinary write alone.

