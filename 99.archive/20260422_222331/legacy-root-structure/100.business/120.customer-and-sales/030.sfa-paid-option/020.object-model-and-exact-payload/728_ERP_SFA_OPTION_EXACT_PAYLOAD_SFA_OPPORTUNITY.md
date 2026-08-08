# ============================================================
# ERP SFA OPTION EXACT PAYLOAD SFA OPPORTUNITY
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-728
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.exact_payload.sfa_opportunity
component: sfa-option-exact-payload-sfa-opportunity


# OBJECT

sfa_opportunity


# CANONICAL PAYLOAD

- object_id
- company_id
- object_type = sfa_opportunity
- status
- opportunity_code
- linked_account_reference_id
- linked_contact_reference_id
- source_lead_id
- owner_user_id
- stage_code
- pipeline_code
- opportunity_name
- expected_amount
- probability_percent
- close_target_date
- forecast_bucket_code
- competitor_presence_code
- loss_risk_code
- next_action_due_at
- won_at
- lost_at
- win_loss_reason_code
- created_at
- created_by
- updated_at
- updated_by
- archived_at
- archived_by
- archive_reason


# RULE

Opportunity stage_code is source SFA truth for pipeline progression.
It must not be inferred only from action history.

