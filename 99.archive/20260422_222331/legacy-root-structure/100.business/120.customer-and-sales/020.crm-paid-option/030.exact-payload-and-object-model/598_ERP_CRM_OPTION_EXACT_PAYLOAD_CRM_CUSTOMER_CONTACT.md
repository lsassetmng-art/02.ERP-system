# ============================================================
# ERP CRM OPTION EXACT PAYLOAD CRM CUSTOMER CONTACT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-598
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.exact_payload.crm_customer_contact
component: crm-option-exact-payload-crm-customer-contact


# OBJECT

crm_customer_contact


# PURPOSE

Represents a person associated with a CRM customer account.


# CANONICAL PAYLOAD

- object_id
- company_id
- object_type = crm_customer_contact
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
- external_reference_code
- notes_summary
- created_at
- created_by
- updated_at
- updated_by
- archived_at
- archived_by
- archive_reason


# REQUIRED INTERPRETATION

- a contact belongs to an account but is not the account
- contact_role_code is exact classification, not free prose
- last_interaction_at is derivative operational context, not substitute for history log
- boolean flags do not replace broader role interpretation when needed

