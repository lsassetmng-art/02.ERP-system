# ============================================================
# ERP SALES CORE VS CRM SFA BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1353
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_core_vs_crm_sfa.boundary_rule
component: sales-core-vs-crm-sfa-boundary-rule


# RULE

CRM and SFA own:
- lead activity
- opportunity flow
- frontline pipeline activity

Sales core owns:
- quote
- order
- fulfillment instruction
- billing instruction
- return request

# CONSEQUENCE

CRM/SFA may feed sales creation context,
but do not replace sales-core commercial commitment truth.

