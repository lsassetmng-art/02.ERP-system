# ============================================================
# ERP SFA PAID OPTION REQUEST RESPONSE CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2384
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sfa_paid_option.request_response.contracts
component: sfa-paid-option-request-response-contracts


# REPRESENTATIVE WRITE REQUEST BODIES

sales_lead write:
- linked_customer_account_id
- linked_customer_contact_id
- lead_source_code
- lead_owner_reference_code
- lead_priority_code
- qualification_state_code
- expected_value_amount

sales_opportunity write:
- linked_sales_lead_id
- linked_customer_account_id
- opportunity_name
- opportunity_owner_reference_code
- target_close_date
- weighted_pipeline_amount
- win_probability_percent
- linked_sales_conversion_reference_code

opportunity_stage_progression write:
- linked_sales_opportunity_id
- from_stage_code
- to_stage_code
- progression_reason_code
- progressed_at
- progressed_by_reference_code
- blocked_flag

sales_forecast_case write:
- linked_sales_opportunity_id
- forecast_period_code
- forecast_category_code
- forecast_amount
- forecast_confidence_percent
- forecast_summary_text
- forecasted_at

next_action_task write:
- linked_sales_opportunity_id
- linked_customer_account_id
- task_type_code
- assigned_owner_reference_code
- due_at
- completion_at
- task_summary_text

