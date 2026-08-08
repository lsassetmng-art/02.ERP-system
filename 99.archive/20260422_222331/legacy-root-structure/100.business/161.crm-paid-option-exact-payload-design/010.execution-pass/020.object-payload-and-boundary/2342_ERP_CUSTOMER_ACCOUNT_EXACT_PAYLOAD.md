# ============================================================
# ERP CUSTOMER ACCOUNT EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2342
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.customer_account.exact_payload
component: customer-account-exact-payload


# OBJECT

customer_account

Canonical payload:
- object_id
- company_id
- object_type = customer_account
- status
- customer_account_code
- account_status_code
- customer_name
- customer_type_code
- account_owner_reference_code
- primary_industry_code
- primary_region_code
- lifecycle_stage_code
- linked_sales_conversion_reference_code
- created_at
- created_by
- updated_at
- updated_by

