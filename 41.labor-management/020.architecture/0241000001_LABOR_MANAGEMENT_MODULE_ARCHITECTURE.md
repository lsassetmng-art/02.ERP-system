# ============================================================
# LABOR MANAGEMENT MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 41.labor-management

## 1. Logical components
1. Attendance Service
2. Shift Planning Service
3. Leave Management Service
4. Overtime Control Service
5. Work Record Service
6. Payroll Basis Bridge Service

## 2. Main aggregates
- labor_attendance
- labor_shift
- labor_leave_request
- labor_overtime_request
- labor_work_record
- labor_payroll_basis_reference

## 3. Inbound dependencies
From 40.human-resources:
- active worker and assignment reference

## 4. Outbound surfaces
To 42.payroll:
- approved payroll basis reference
- attendance/overtime/leave summarized basis

## 5. Rule
Labor Management owns labor operational truth.
Payroll derives pay result from approved basis only.
