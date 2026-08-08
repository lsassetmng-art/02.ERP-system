# ============================================================
# ERP ANALYTICS VS BUSINESS ACCOUNTING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1859
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics_vs_business_accounting.boundary_rule
component: analytics-vs-business-accounting-boundary-rule


# RULE

Business core owns operational source truth.
Accounting core owns posting and close truth.

Analytics core owns:
- derived model truth
- metric definition truth
- analytical view snapshot truth
- insight and scenario interpretation truth

# CONSEQUENCE

Business or accounting visibility may feed analytics work,
but it does not replace analytics-owned derived interpretation truth.

