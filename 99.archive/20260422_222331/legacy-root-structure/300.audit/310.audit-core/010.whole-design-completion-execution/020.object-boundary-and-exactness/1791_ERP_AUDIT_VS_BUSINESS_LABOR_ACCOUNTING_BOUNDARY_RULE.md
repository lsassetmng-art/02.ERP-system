# ============================================================
# ERP AUDIT VS BUSINESS LABOR ACCOUNTING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1791
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.audit_vs_business_labor_accounting.boundary_rule
component: audit-vs-business-labor-accounting-boundary-rule


# RULE

Business core owns operational business truth.
LaborManager owns labor operation truth.
Accounting core owns posting and close truth.

Audit core owns:
- evidence truth
- finding truth
- conclusion truth
- follow-up closure truth

# CONSEQUENCE

Operational and posting visibility may feed audit work,
but they do not replace audit-owned assurance truth.

