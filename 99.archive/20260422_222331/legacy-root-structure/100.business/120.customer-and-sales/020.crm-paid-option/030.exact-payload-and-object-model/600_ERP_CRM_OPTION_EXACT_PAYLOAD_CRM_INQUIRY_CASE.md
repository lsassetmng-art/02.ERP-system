# ============================================================
# ERP CRM OPTION EXACT PAYLOAD CRM INQUIRY CASE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-600
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.exact_payload.crm_inquiry_case
component: crm-option-exact-payload-crm-inquiry-case


# OBJECT

crm_inquiry_case


# PURPOSE

Represents a customer inquiry or customer-facing case
tracked inside the CRM option.


# CANONICAL PAYLOAD

- object_id
- company_id
- object_type = crm_inquiry_case
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
- summary
- resolution_summary
- related_interaction_last_id
- related_transaction_reference_id
- escalation_flag
- escalation_reason_code
- created_at
- created_by
- updated_at
- updated_by
- archived_at
- archived_by
- archive_reason


# REQUIRED INTERPRETATION

- inquiry_status_code is exact status truth
- summary and resolution_summary must remain distinct
- first_response_at and last_response_at must not be inferred only from interaction ordering when exact values are needed
- escalation_flag requires corresponding reason if true

