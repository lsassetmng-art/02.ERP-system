# ============================================================
# LABOR MANAGEMENT MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 41.labor-management
owner: Boss
prepared_by: Zero

## 1. Purpose
The Labor Management module governs labor-control operational truth.
It is the canonical module for attendance, shift, leave, overtime, work-record,
and labor-approval-ready operational results.

## 2. Canonical scope
The module owns:
- attendance canon
- shift canon
- leave request/result canon
- overtime request/result canon
- work-record canon
- labor exception canon

## 3. Non-scope
It does not own:
- employment lifecycle truth -> 40.human-resources
- payroll result truth -> 42.payroll
- journal truth -> 30.accounting

## 4. Submodule split
- 01.attendance
- 02.shift
- 03.leave
- 04.overtime
- 05.work-record

## 5. Boundary rule
Labor Management owns when and how labor time is recorded and approved operationally.
Payroll consumes approved labor basis but owns pay-result truth.
