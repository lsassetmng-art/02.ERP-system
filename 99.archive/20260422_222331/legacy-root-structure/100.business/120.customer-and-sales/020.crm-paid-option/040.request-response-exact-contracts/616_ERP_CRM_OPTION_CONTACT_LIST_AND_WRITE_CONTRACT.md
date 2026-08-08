# ============================================================
# ERP CRM OPTION CONTACT LIST AND WRITE CONTRACT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-616
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.contact_list_and_write_contract
component: crm-option-contact-list-and-write-contract


# CONTACT LIST REQUEST BODY

- account_id
- status_set
- role_code_set
- search_text
- page
- page_size


# CONTACT LIST RESPONSE DATA

- items
  - object_id
  - object_type = crm_customer_contact
  - company_id
  - status
  - account_id
  - contact_display_name
  - family_name
  - given_name
  - department_name
  - title_name
  - contact_role_code
  - primary_email
  - primary_phone
  - preferred_contact_channel_code
  - decision_influence_code
  - inquiry_contact_flag
  - billing_contact_flag
  - site_contact_flag
  - last_interaction_at
  - updated_at
- total_count
- page
- page_size


# CONTACT CREATE REQUEST BODY

- account_id
- contact_display_name
- family_name
- given_name
- department_name
- title_name
- contact_role_code
- primary_email
- primary_phone
- preferred_contact_channel_code
- decision_influence_code
- inquiry_contact_flag
- billing_contact_flag
- site_contact_flag
- external_reference_code
- notes_summary


# CONTACT UPDATE REQUEST BODY

- object_id
- update_mask
- patch
  - contact_display_name
  - family_name
  - given_name
  - department_name
  - title_name
  - contact_role_code
  - primary_email
  - primary_phone
  - preferred_contact_channel_code
  - decision_influence_code
  - inquiry_contact_flag
  - billing_contact_flag
  - site_contact_flag
  - external_reference_code
  - notes_summary


# WRITE RESPONSE DATA

- written_object
  - full crm_customer_contact canonical payload
- audit_context

