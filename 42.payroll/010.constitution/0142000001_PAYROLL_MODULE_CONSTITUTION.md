# ============================================================
# PAYROLL MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 42.payroll
owner: Boss
prepared_by: Zero

## 1. Purpose
The Payroll module governs payroll result truth.
It is the canonical module for payroll basis consumption, earning/deduction calculation,
payroll result canon, payroll close, and payroll accounting reference emission.

## 2. Canonical scope
The module owns:
- payroll calculation basis consumption canon
- payroll result canon
- earning/deduction result canon
- payroll run canon
- payroll close status canon
- payroll accounting reference canon

## 3. Non-scope
It does not own:
- employment lifecycle truth -> 40.human-resources
- attendance and overtime operational truth -> 41.labor-management
- journal truth -> 30.accounting

## 4. Lifecycle
Basis Ready
-> Payroll Run Draft
-> Calculated
-> Reviewed
-> Confirmed
-> Closed
or
-> Reversed / Corrected

## 5. Boundary rule
Payroll owns pay-result truth.
Accounting owns journal truth.
