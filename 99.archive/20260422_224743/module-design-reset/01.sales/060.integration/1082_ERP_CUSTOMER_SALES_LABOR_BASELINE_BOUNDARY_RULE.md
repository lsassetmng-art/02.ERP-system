# ============================================================
# ERP CUSTOMER SALES LABOR BASELINE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1082
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.customer_sales_labor.baseline_boundary_rule
component: customer-sales-labor-baseline-boundary-rule


# RULE

CRM owns customer base and relationship truth.

SFA owns sales-front execution and opportunity-flow truth.

LaborManager owns labor-governance and staff-operation truth.


# CONSEQUENCE

Customer and sales-side signals may influence planning or staffing views later,
but must not overwrite labor-governance truth.

