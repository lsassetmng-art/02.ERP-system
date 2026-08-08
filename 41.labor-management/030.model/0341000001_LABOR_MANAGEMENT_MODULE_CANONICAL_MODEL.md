# ============================================================
# LABOR MANAGEMENT MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 41.labor-management

Entities:
- labor_attendance
- labor_shift
- labor_leave_request
- labor_overtime_request
- labor_work_record
- labor_payroll_basis_reference

Status canon:
- draft
- submitted
- approved
- rejected
- completed
- cancelled

Invariant:
- payroll basis reference must be reproducible from approved attendance/leave/overtime/work records
