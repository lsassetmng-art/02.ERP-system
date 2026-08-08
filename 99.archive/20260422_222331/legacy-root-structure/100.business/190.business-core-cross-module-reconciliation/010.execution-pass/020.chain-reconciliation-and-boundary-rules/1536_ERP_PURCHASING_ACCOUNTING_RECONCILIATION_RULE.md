# ============================================================
# ERP PURCHASING ACCOUNTING RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1536
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchasing_accounting.reconciliation_rule
component: purchasing-accounting-reconciliation-rule


# RULE

Purchasing may create sourcing commitment and supplier return truth.

Accounting may create posting, correction, and reversal truth.

# CONSEQUENCE

Supplier-facing purchasing actions may trigger accounting behavior,
but must remain distinguishable from:
- accounts payable or posting truth
- correction truth
- period close truth

