# ============================================================
# ERP PURCHASE VS ACCOUNTING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2142
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase_vs_accounting.boundary_rule
component: purchase-vs-accounting-boundary-rule


# RULE

Purchase owns:
- supplier invoice intake truth

Accounting owns:
- payable document truth
- journal truth
- payable position truth

# CONSEQUENCE

Supplier invoice intake is not posting truth.
Accounting handoff state is not accounting-owned payable truth.

