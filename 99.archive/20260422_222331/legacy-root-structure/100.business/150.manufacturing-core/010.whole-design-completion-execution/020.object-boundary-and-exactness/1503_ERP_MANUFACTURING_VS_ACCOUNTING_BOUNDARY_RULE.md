# ============================================================
# ERP MANUFACTURING VS ACCOUNTING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1503
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_vs_accounting.boundary_rule
component: manufacturing-vs-accounting-boundary-rule


# RULE

Manufacturing core owns production execution and completion truth.

Accounting owns:
- journal truth
- ledger truth
- correction truth
- close-cycle truth

# CONSEQUENCE

Manufacturing completion, scrap, or variance context may trigger accounting behavior,
but they are not themselves accounting posting truth.

