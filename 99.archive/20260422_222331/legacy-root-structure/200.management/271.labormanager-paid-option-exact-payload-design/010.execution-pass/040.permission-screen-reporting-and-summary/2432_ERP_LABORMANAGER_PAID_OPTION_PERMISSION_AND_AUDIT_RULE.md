# ============================================================
# ERP LABORMANAGER PAID OPTION PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2432
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager_paid_option.permission_and_audit.rule
component: labormanager-paid-option-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- labor_read
- labor_staff_manage
- labor_attendance_manage
- labor_leave_manage
- labor_onboarding_manage
- labor_offboarding_manage
- labor_training_manage
- labor_compliance_manage
- labor_export
- labor_audit_read
- labor_override

# RULE

Attendance manage does not imply override.
Compliance manage does not imply export.
Read does not imply offboarding manage.

