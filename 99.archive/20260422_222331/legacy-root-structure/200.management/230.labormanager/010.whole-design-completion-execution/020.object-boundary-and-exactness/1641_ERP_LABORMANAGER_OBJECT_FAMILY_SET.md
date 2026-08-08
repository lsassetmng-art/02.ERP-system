# ============================================================
# ERP LABORMANAGER OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1641
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager.object_family_set
component: labormanager-object-family-set


# PRIMARY OBJECT FAMILIES

- labor_staff_profile
- labor_attendance_record
- labor_leave_request
- labor_employment_lifecycle_case
- labor_compliance_case

# RULE

Staff profile is not attendance record.
Attendance record is not leave request.
Leave request is not employment lifecycle case.
Employment lifecycle case is not labor compliance case.

