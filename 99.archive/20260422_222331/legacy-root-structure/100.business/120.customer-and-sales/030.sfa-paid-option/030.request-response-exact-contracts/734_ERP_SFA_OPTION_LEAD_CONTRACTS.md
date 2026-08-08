# ============================================================
# ERP SFA OPTION LEAD CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-734
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.lead_contracts
component: sfa-option-lead-contracts


# LIST REQUEST BODY

- search_text
- qualification_status_code_set
- owner_user_id_set
- lead_source_code_set
- page
- page_size


# LIST RESPONSE DATA

- items
  - object_id
  - object_type = sfa_lead
  - company_id
  - status
  - lead_code
  - lead_name
  - linked_account_reference_id
  - owner_user_id
  - qualification_status_code
  - lead_temperature_code
  - next_action_due_at
  - expected_value_amount
  - updated_at
- total_count
- page
- page_size


# CREATE / UPDATE RULE

Lead create and update must be separate from
lead qualification transition.

