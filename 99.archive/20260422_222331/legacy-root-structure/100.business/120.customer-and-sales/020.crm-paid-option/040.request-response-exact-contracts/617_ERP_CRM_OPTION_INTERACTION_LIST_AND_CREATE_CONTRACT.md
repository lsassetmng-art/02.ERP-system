# ============================================================
# ERP CRM OPTION INTERACTION LIST AND CREATE CONTRACT
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-617
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.interaction_list_and_create_contract
component: crm-option-interaction-list-and-create-contract


# LIST REQUEST BODY

- account_id
- contact_id
- interaction_channel_code_set
- interaction_direction_code_set
- occurred_from
- occurred_to
- followup_required_flag
- page
- page_size


# LIST RESPONSE DATA

- items
  - object_id
  - object_type = crm_interaction_log
  - company_id
  - status
  - account_id
  - contact_id
  - interaction_channel_code
  - interaction_direction_code
  - interaction_subject
  - interaction_summary
  - interaction_occurred_at
  - interaction_recorded_at
  - interaction_recorded_by
  - interaction_outcome_code
  - followup_required_flag
  - followup_due_at
  - related_inquiry_case_id
  - related_transaction_reference_id
  - confidentiality_code
- total_count
- page
- page_size


# CREATE REQUEST BODY

- account_id
- contact_id
- interaction_channel_code
- interaction_direction_code
- interaction_subject
- interaction_summary
- interaction_occurred_at
- interaction_outcome_code
- followup_required_flag
- followup_due_at
- related_inquiry_case_id
- related_transaction_reference_id
- confidentiality_code


# CREATE RESPONSE DATA

- created_object
  - full crm_interaction_log canonical payload
- audit_context
- warnings

