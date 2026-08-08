# ============================================================
# ERP ACCOUNTING VS PURCHASE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2206
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting_vs_purchase.boundary_rule
component: accounting-vs-purchase-boundary-rule


# RULE

Accounting owns:
- document draft truth
- journal truth
- payable position truth

Purchase owns:
- sourcing commitment truth
- supplier invoice intake truth

# CONSEQUENCE

Supplier invoice intake is not journal truth.
Payable position is not purchase-owned sourcing truth.

