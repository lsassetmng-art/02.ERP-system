# ============================================================
# ERP LABORMANAGER VS PAYROLL BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2418
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager_vs_payroll.boundary_rule
component: labormanager-vs-payroll-boundary-rule


# RULE

LaborManager owns:
- attendance truth
- leave truth
- onboarding and offboarding truth
- training and compliance truth

Payroll owns:
- payroll calculation truth
- payroll payment truth

# CONSEQUENCE

Attendance approval is not payroll calculation truth.
Leave governance is not payroll payment truth.
LaborManager may hand off payroll-relevant visibility,
but it does not replace payroll-owned calculation truth.

