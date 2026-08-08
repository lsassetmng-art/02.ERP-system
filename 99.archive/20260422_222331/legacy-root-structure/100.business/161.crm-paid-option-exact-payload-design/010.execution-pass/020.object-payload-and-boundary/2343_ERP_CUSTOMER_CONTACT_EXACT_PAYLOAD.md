# ============================================================
# ERP CUSTOMER CONTACT EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2343
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.customer_contact.exact_payload
component: customer-contact-exact-payload


# OBJECT

customer_contact

Canonical payload:
- object_id
- company_id
- object_type = customer_contact
- status
- customer_contact_code
- contact_status_code
- linked_customer_account_id
- contact_name
- department_name
- role_title
- email_address
- phone_number
- preferred_contact_channel_code
- primary_contact_flag
- created_at
- created_by
- updated_at
- updated_by

