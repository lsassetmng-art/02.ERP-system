# ============================================================
# ERP MANUFACTURING ACCOUNTING RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1537
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_accounting.reconciliation_rule
component: manufacturing-accounting-reconciliation-rule


# RULE

Manufacturing may create:
- production execution truth
- completion truth
- scrap declaration truth

Accounting may create:
- variance-related posting truth
- cost posting truth
- correction and close truth

# CONSEQUENCE

Manufacturing output, scrap, or variance context
must not be mistaken for accounting posting truth.

