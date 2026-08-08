# ============================================================
# ERP SALES OPPORTUNITY EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2375
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_opportunity.exact_payload
component: sales-opportunity-exact-payload


# OBJECT

sales_opportunity

Canonical payload:
- object_id
- company_id
- object_type = sales_opportunity
- status
- sales_opportunity_code
- opportunity_status_code
- linked_sales_lead_id
- linked_customer_account_id
- opportunity_name
- opportunity_owner_reference_code
- target_close_date
- weighted_pipeline_amount
- win_probability_percent
- linked_sales_conversion_reference_code
- created_at
- created_by
- updated_at
- updated_by

