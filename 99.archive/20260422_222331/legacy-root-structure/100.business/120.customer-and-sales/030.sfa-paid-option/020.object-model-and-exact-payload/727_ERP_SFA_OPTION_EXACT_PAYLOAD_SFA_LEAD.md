# ============================================================
# ERP SFA OPTION EXACT PAYLOAD SFA LEAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-727
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.exact_payload.sfa_lead
component: sfa-option-exact-payload-sfa-lead


# OBJECT

sfa_lead


# CANONICAL PAYLOAD

- object_id
- company_id
- object_type = sfa_lead
- status
- lead_code
- lead_source_code
- lead_channel_code
- lead_name
- linked_account_reference_id
- linked_contact_reference_id
- owner_user_id
- qualification_status_code
- lead_temperature_code
- interest_summary
- next_action_due_at
- expected_value_amount
- expected_close_window_code
- created_at
- created_by
- updated_at
- updated_by
- archived_at
- archived_by
- archive_reason


# RULE

Lead may point to CRM/customer reference,
but is not owned by CRM.

