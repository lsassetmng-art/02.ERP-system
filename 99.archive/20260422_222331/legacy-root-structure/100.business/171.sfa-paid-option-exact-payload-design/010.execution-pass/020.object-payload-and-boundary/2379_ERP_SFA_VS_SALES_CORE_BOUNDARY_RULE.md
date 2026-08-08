# ============================================================
# ERP SFA VS SALES CORE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2379
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sfa_vs_sales_core.boundary_rule
component: sfa-vs-sales-core-boundary-rule


# RULE

SFA owns:
- lead and opportunity execution truth
- forecast visibility truth

Sales core owns:
- quote truth
- order truth
- fulfillment instruction truth
- invoice request truth

# CONSEQUENCE

An opportunity is not quote truth.
A forecast case is not order truth.
Conversion visibility may link SFA to sales,
but it does not replace sales-owned transaction truth.

