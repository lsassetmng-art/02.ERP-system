# ============================================================
# PAYROLL MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 42.payroll

Entities:
- payroll_run
- payroll_basis_consumption
- payroll_result
- payroll_earning_deduction_result
- payroll_close_control
- payroll_accounting_reference

Status canon:
- basis_ready
- draft
- calculated
- reviewed
- confirmed
- closed
- reversed
- corrected

Invariant:
- confirmed payroll result remains reproducible from consumed basis and rule version
