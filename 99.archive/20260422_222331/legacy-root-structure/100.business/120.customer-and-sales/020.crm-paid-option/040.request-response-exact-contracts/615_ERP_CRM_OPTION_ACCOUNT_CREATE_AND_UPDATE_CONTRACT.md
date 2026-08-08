# ============================================================
# ERP CRM OPTION ACCOUNT CREATE AND UPDATE CONTRACT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-615
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.account_create_and_update_contract
component: crm-option-account-create-and-update-contract


# CREATE REQUEST BODY

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


# CREATE RESPONSE DATA

- created_object
  - full crm_customer_account canonical payload
- audit_context
- warnings


# UPDATE REQUEST BODY

- object_id
- update_mask
- patch
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


# UPDATE RESPONSE DATA

- updated_object
  - full crm_customer_account canonical payload
- changed_field_set
- audit_context


# RULE

Update must not require the client to resend the entire object
when only a subset is changing.

