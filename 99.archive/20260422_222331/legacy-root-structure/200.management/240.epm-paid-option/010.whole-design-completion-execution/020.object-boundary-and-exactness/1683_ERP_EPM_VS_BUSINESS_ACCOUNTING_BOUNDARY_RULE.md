# ============================================================
# ERP EPM VS BUSINESS ACCOUNTING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1683
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.epm_vs_business_accounting.boundary_rule
component: epm-vs-business-accounting-boundary-rule


# RULE

Business core owns operational actuals truth.
Accounting core owns posting and close truth.

EPM owns:
- target structure meaning
- KPI definition meaning
- scorecard and variance interpretation truth

# CONSEQUENCE

Business or accounting actuals may feed EPM calculations,
but they do not replace EPM-owned performance interpretation truth.

