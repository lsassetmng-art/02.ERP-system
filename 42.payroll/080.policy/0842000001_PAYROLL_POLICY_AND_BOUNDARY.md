# ============================================================
# PAYROLL POLICY AND BOUNDARY
# ============================================================

status: draft-exact-design
module: 42.payroll

- Payroll owns pay-result truth
- Labor Management owns labor operational truth
- Human Resources owns employment lifecycle truth
- Accounting owns journal truth
- payroll corrections remain auditable
