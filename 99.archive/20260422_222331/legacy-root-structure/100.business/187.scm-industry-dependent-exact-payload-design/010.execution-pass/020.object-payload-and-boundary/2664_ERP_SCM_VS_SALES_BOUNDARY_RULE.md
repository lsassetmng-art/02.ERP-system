# ============================================================
# ERP SCM VS SALES BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2664
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.scm_vs_sales.boundary_rule
component: scm-vs-sales-boundary-rule


# RULE

SCM owns:
- network coordination truth
- service-level exception truth

Sales owns:
- demand commitment truth
- commercial commitment truth

# CONSEQUENCE

A service-level exception is not sales-order truth.
A coordination case may consume demand references,
but it does not replace sales-owned truth.

