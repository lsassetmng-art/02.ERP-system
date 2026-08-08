# ============================================================
# ERP ACCOUNTING VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1428
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting_vs_management.boundary_rule
component: accounting-vs-management-boundary-rule


# RULE

Management may summarize or review accounting conditions.

Accounting owns:
- journal truth
- ledger truth
- correction truth
- reversal truth
- close-cycle truth

# CONSEQUENCE

Management reporting or review does not replace accounting-core truth ownership.

