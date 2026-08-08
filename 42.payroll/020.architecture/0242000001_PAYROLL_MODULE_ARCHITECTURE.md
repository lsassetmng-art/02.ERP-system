# ============================================================
# PAYROLL MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 42.payroll

## 1. Logical components
1. Payroll Basis Consumption Service
2. Payroll Calculation Service
3. Earning / Deduction Result Service
4. Payroll Close Service
5. Payroll Accounting Reference Bridge Service

## 2. Main aggregates
- payroll_run
- payroll_basis_consumption
- payroll_result
- payroll_earning_deduction_result
- payroll_close_control
- payroll_accounting_reference

## 3. Inbound dependencies
From 40.human-resources:
- employment/pay group reference

From 41.labor-management:
- approved payroll basis reference

## 4. Outbound surfaces
To 30.accounting:
- payroll accounting reference payload

## 5. Rule
Payroll result must be reproducible from consumed basis and payroll rules.
Accounting remains journal truth owner.
