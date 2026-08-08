# ============================================================
# ERP CRM OPTION ESTIMATE ORDER BILLING REFERENCE BOUNDARY
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-707
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.estimate_order_billing.reference_boundary
component: crm-option-estimate-order-billing-reference-boundary


# RULE

Estimate, order, and billing objects may reference CRM context,
but must not become CRM-owned objects by mere linkage.


# REFERENCE EXAMPLES

- crm_interaction_log.related_transaction_reference_id
- crm_inquiry_case.related_transaction_reference_id
- core customer_reference_id linked to crm_customer_account


# CONSEQUENCE

CRM enriches business interpretation.

Business execution objects remain business-side truth.

