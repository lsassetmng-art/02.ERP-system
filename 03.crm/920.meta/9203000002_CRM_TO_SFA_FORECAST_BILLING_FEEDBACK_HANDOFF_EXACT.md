# ============================================================
# CRM TO SFA / FORECAST / BILLING FEEDBACK HANDOFF EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 03.crm
track: Track C
related_modules:
- 02.sfa
- 06.demand-forecasting
- 05.billing
- 52.master-data
- 60.business-intelligence

purpose:
Define detailed CRM handoffs to SFA and demand forecasting, and define how
billing feedback may update CRM relationship context without rewriting billing
or CRM history incorrectly.

canonical_role:
- CRM relationship / account / contact / interaction truth

# ============================================================
# 1. CRM TO SFA LEAD CANDIDATE
# ============================================================

handoff_object_name:
- crm_to_sfa_lead_candidate

required_fields:
- crm_sfa_candidate_id
- company_id
- source_module
- target_module
- crm_account_profile_id
- crm_contact_profile_id_or_null
- master_customer_or_partner_reference
- interaction_reference_set_or_null
- candidate_type
- product_or_service_interest_or_null
- estimated_need_date_or_null
- candidate_score_or_null
- candidate_summary
- handoff_status
- created_at
- lineage_reference

candidate_type_examples:
- new_lead
- upsell_candidate
- cross_sell_candidate
- renewal_candidate
- reactivation_candidate
- opportunity_candidate
- complaint_recovery_candidate

allowed_handoff_status:
- building
- handoff_ready
- sent_to_sfa
- accepted_by_sfa
- rejected_by_sfa
- converted_to_lead
- cancelled
- superseded

rules:
- source_module must be 03.crm
- target_module must be 02.sfa
- candidate is not SFA lead until accepted by 02
- CRM interaction and relationship history remain CRM truth
- SFA rejection does not delete CRM candidate evidence

# ============================================================
# 2. CRM TO DEMAND FORECASTING SIGNAL
# ============================================================

handoff_object_name:
- crm_to_demand_forecasting_customer_signal

required_fields:
- crm_forecast_signal_id
- company_id
- source_module
- target_module
- crm_account_profile_id_or_segment_reference
- master_customer_or_partner_reference_or_null
- signal_type
- product_or_category_reference_or_null
- region_or_channel_reference_or_null
- signal_period_start_or_null
- signal_period_end_or_null
- signal_strength_or_quantity_or_null
- signal_summary
- evidence_reference_set_or_null
- handoff_status
- created_at
- lineage_reference

signal_type_examples:
- customer_interest
- churn_risk
- reactivation_target
- campaign_response
- segment_growth_signal
- preference_shift
- complaint_volume_signal
- retention_risk_signal
- account_expansion_signal

allowed_handoff_status:
- building
- handoff_ready
- sent_to_demand_forecasting
- accepted_by_demand_forecasting
- rejected_by_demand_forecasting
- consumed_in_forecast_run
- cancelled
- superseded

rules:
- source_module must be 03.crm
- target_module must be 06.demand-forecasting
- signal is forecast input only
- 06 owns forecast truth
- forecast feedback does not rewrite CRM interaction history

# ============================================================
# 3. BILLING TO CRM CUSTOMER SIGNAL INTAKE
# ============================================================

accepted_feedback_object:
- billing_to_crm_customer_billing_signal

meaning:
- billing-side customer payment/invoice/dispute signal consumed by CRM as relationship context

required_fields:
- billing_crm_signal_id
- company_id
- source_module
- target_module
- customer_id_or_master_reference
- customer_invoice_id_or_null
- billing_signal_type
- billing_signal_summary
- amount_or_status_reference_or_null
- signal_occurred_at
- feedback_status
- lineage_reference

billing_signal_type_examples:
- invoice_issued
- invoice_paid
- overdue
- disputed
- credit_memo_issued
- refund_issued
- billing_complaint
- high_value_customer_signal

allowed_feedback_status:
- received
- accepted_by_crm
- rejected_by_crm
- converted_to_crm_case
- converted_to_relationship_signal
- cancelled
- superseded

rules:
- source_module must be 05.billing
- target_module must be 03.crm
- CRM may create interaction/case/relationship signal
- CRM does not rewrite invoice or payment truth
- billing does not own CRM relationship status

# ============================================================
# 4. CRM RESPONSE TO FEEDBACK
# ============================================================

crm_response_options:
- create CRM interaction
- create CRM case/inquiry
- update relationship status by CRM workflow
- update segment assignment by CRM workflow
- create SFA candidate
- ignore with reason
- request billing clarification

rules:
- response must preserve source feedback lineage
- CRM update must not alter source billing record
- if customer identity is wrong, route to 52.master-data

# ============================================================
# 5. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- billing overdue status directly changing CRM relationship status without CRM workflow
- CRM billing signal directly marking invoice paid
- CRM forecast signal treated as demand forecast
- CRM lead candidate treated as SFA lead
- BI dashboard converting CRM signal to SFA lead

# ============================================================
# 6. COMPLETION STATE
# ============================================================

completion_state:
- CRM detailed handoffs to SFA and demand forecasting fixed
- billing feedback intake fixed
- CRM relationship update boundary fixed

# ============================================================
