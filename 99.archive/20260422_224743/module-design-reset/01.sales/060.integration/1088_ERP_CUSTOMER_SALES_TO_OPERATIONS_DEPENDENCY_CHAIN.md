# ============================================================
# ERP CUSTOMER SALES TO OPERATIONS DEPENDENCY CHAIN
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1088
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.customer_sales_to_operations.dependency_chain
component: customer-sales-to-operations-dependency-chain


# CHAIN

CRM customer truth
-> SFA opportunity and pipeline flow
-> downstream planning or management interpretation where needed
-> later operational response in option families


# RULE

Customer and sales-side signals may feed views or future planning context,
but downstream operational truth remains owned by the receiving option family.

