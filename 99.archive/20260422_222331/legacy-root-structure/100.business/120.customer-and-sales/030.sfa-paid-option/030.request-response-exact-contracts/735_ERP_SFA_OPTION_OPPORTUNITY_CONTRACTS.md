# ============================================================
# ERP SFA OPTION OPPORTUNITY CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-735
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.opportunity_contracts
component: sfa-option-opportunity-contracts


# LIST REQUEST BODY

- owner_user_id_set
- stage_code_set
- forecast_bucket_code_set
- pipeline_code_set
- close_target_from
- close_target_to
- page
- page_size


# LIST RESPONSE DATA

- items
  - object_id
  - object_type = sfa_opportunity
  - company_id
  - status
  - opportunity_code
  - opportunity_name
  - owner_user_id
  - stage_code
  - expected_amount
  - probability_percent
  - close_target_date
  - forecast_bucket_code
  - next_action_due_at
  - updated_at


# DETAIL / WRITE RULE

Stage transition must be separate from ordinary patch update.

