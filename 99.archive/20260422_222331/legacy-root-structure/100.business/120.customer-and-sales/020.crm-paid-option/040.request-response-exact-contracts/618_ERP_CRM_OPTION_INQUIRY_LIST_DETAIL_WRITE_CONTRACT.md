# ============================================================
# ERP CRM OPTION INQUIRY LIST DETAIL WRITE CONTRACT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-618
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.inquiry_list_detail_write_contract
component: crm-option-inquiry-list-detail-write-contract


# LIST REQUEST BODY

- account_id
- contact_id
- inquiry_category_code_set
- inquiry_priority_code_set
- inquiry_status_code_set
- assigned_owner_user_id_set
- opened_from
- opened_to
- page
- page_size


# LIST RESPONSE DATA

- items
  - object_id
  - object_type = crm_inquiry_case
  - company_id
  - status
  - account_id
  - contact_id
  - inquiry_case_code
  - inquiry_channel_code
  - inquiry_category_code
  - inquiry_priority_code
  - inquiry_status_code
  - opened_at
  - first_response_at
  - last_response_at
  - closed_at
  - assigned_owner_user_id
  - response_sla_code
  - subject
  - escalation_flag
  - escalation_reason_code
- total_count
- page
- page_size


# DETAIL REQUEST BODY

- object_id


# DETAIL RESPONSE DATA

- full crm_inquiry_case canonical payload


# CREATE REQUEST BODY

- account_id
- contact_id
- inquiry_channel_code
- inquiry_category_code
- inquiry_priority_code
- assigned_owner_user_id
- response_sla_code
- subject
- summary
- related_transaction_reference_id


# UPDATE REQUEST BODY

- object_id
- update_mask
- patch
  - inquiry_priority_code
  - inquiry_status_code
  - assigned_owner_user_id
  - first_response_at
  - last_response_at
  - closed_at
  - summary
  - resolution_summary
  - related_interaction_last_id
  - escalation_flag
  - escalation_reason_code


# WRITE RESPONSE DATA

- written_object
  - full crm_inquiry_case canonical payload
- audit_context
- warnings

