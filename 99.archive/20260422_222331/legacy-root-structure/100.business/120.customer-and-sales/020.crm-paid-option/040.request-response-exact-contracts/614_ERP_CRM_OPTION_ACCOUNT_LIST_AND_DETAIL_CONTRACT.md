# ============================================================
# ERP CRM OPTION ACCOUNT LIST AND DETAIL CONTRACT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-614
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.account_list_and_detail_contract
component: crm-option-account-list-and-detail-contract


# LIST REQUEST BODY

Recommended exact request fields:

- search_text
- status_set
- segment_code_set
- lifecycle_code_set
- owner_user_id_set
- page
- page_size
- sort_field
- sort_direction


# LIST RESPONSE DATA

Recommended response shape:

- items
  - object_id
  - object_type = crm_customer_account
  - company_id
  - status
  - account_code
  - account_display_name
  - account_legal_name
  - account_kind_code
  - segment_primary_code
  - lifecycle_current_code
  - crm_owner_user_id
  - updated_at
- total_count
- page
- page_size
- next_page_exists


# DETAIL REQUEST BODY

- object_id


# DETAIL RESPONSE DATA

- object_id
- object_type = crm_customer_account
- company_id
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

