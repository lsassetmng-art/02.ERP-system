# ============================================================
# ERP CRM OPTION EXACT PAYLOAD CRM INTERACTION LOG
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-599
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.exact_payload.crm_interaction_log
component: crm-option-exact-payload-crm-interaction-log


# OBJECT

crm_interaction_log


# PURPOSE

Represents recorded customer-facing interactions.


# CANONICAL PAYLOAD

- object_id
- company_id
- object_type = crm_interaction_log
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
- created_at
- created_by
- updated_at
- updated_by
- archived_at
- archived_by
- archive_reason


# REQUIRED INTERPRETATION

- occurred_at and recorded_at must remain distinct
- summary is not the same as outcome
- confidentiality_code matters for visibility control
- related_transaction_reference_id links to ERP-side business context but does not move the interaction into core

