# ============================================================
# ERP AUDIT BUSINESS ACCOUNTING RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1824
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.audit_business_accounting.reconciliation_rule
component: audit-business-accounting-reconciliation-rule


# RULE

Business core owns operational business truth.
Accounting core owns posting and close truth.

Audit core owns:
- evidence truth
- finding truth
- conclusion truth
- closure truth

# CONSEQUENCE

The chain must preserve:
- business-created operational truth
- accounting-created posting truth
- audit-created assurance truth

