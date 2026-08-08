# ============================================================
# ERP SALES VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2111
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_vs_management.boundary_rule
component: sales-vs-management-boundary-rule


# RULE

Sales owns:
- quote / order / request truth

Management owns:
- approval truth
- review truth
- escalation truth

# CONSEQUENCE

Approval visibility may constrain sales progression,
but management does not replace sales-owned commercial truth.

