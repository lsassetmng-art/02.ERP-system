# ============================================================
# ERP CRM OPTION EXACT PAYLOAD CRM CUSTOMER ACCOUNT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-597
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.exact_payload.crm_customer_account
component: crm-option-exact-payload-crm-customer-account


# OBJECT

crm_customer_account


# PURPOSE

Represents the rich customer account object on the
CRM option side.


# CANONICAL PAYLOAD

- object_id
- company_id
- object_type = crm_customer_account
- status
- account_code
- account_display_name
- account_legal_name
- account_kind_code
- account_stage_code
- primary_industry_code
- country_code
- region_code
- primary_address_text
- website_url
- primary_phone
- primary_email
- primary_contact_id
- crm_owner_user_id
- segment_primary_code
- lifecycle_current_code
- source_origin_code
- source_origin_reference
- merged_into_account_id
- created_at
- created_by
- updated_at
- updated_by
- archived_at
- archived_by
- archive_reason


# REQUIRED INTERPRETATION

- account_display_name is for business/UI readability
- account_legal_name is not optional when known
- segment_primary_code is not the same as lifecycle_current_code
- crm_owner_user_id is not the same as transaction owner in all cases
- merged_into_account_id is only set when merged state exists

