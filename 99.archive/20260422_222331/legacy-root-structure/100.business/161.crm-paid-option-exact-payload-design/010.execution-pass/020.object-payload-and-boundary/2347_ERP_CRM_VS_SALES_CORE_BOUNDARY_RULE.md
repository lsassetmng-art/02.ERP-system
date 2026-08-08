# ============================================================
# ERP CRM VS SALES CORE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2347
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm_vs_sales_core.boundary_rule
component: crm-vs-sales-core-boundary-rule


# RULE

CRM owns:
- customer account and contact truth
- relationship history truth

Sales core owns:
- quote truth
- order truth
- fulfillment instruction truth
- invoice request truth

# CONSEQUENCE

A customer account is not quote truth.
Conversion visibility may link CRM to sales,
but it does not replace sales-owned transaction truth.

