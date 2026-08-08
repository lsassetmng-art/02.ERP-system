# ============================================================
# ERP PURCHASING VS ACCOUNTING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1466
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchasing_vs_accounting.boundary_rule
component: purchasing-vs-accounting-boundary-rule


# RULE

Purchasing core owns supplier-facing sourcing commitment truth.

Accounting owns:
- journal truth
- ledger truth
- correction truth
- close-cycle truth

# CONSEQUENCE

Purchasing receipt expectation or supplier return may trigger accounting behavior,
but they are not themselves accounting posting truth.

