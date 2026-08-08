# ============================================================
# SFA LEAD / OPPORTUNITY / ACTIVITY / PIPELINE EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 02.sfa
track: Track C
related_modules:
- 03.crm
- 01.sales
- 04.order-management
- 06.demand-forecasting
- 52.master-data
- 60.business-intelligence

purpose:
Define SFA truth for lead, qualification, opportunity, sales activity,
pipeline, opportunity-to-quote request basis, and forecast signal boundaries.

canonical_role:
- lead / opportunity / sales activity / pipeline truth

# ============================================================
# 1. CORE SFA OBJECTS
# ============================================================

core_objects:
- sfa_lead
- sfa_lead_qualification
- sfa_opportunity
- sfa_opportunity_stage_history
- sfa_sales_activity
- sfa_pipeline_forecast_signal
- sfa_opportunity_quote_request_basis
- sfa_to_demand_forecasting_pipeline_signal
- sfa_to_bi_snapshot

# ============================================================
# 2. LEAD INTAKE
# ============================================================

accepted_input_examples:
- crm_to_sfa_lead_candidate
- manual_lead_entry
- campaign_lead_import
- web_form_lead
- partner_referral_lead
- event_lead_import

object_name:
- sfa_lead

meaning:
- canonical sales lead record

required_fields:
- lead_id
- company_id
- lead_source_type
- source_reference_or_null
- master_customer_or_partner_reference_or_null
- crm_account_profile_id_or_null
- crm_contact_profile_id_or_null
- lead_name_or_summary
- product_or_service_interest_or_null
- estimated_need_date_or_null
- lead_score_or_null
- lead_status
- assigned_sales_owner_or_null
- created_at
- updated_at
- lineage_reference

lead_source_type_examples:
- crm_candidate
- campaign
- web
- referral
- event
- manual
- imported
- partner

allowed_lead_status:
- new
- assigned
- contacted
- qualification_pending
- qualified
- disqualified
- converted_to_opportunity
- nurturing
- cancelled
- superseded

rules:
- lead belongs to 02.sfa
- CRM candidate is not lead until accepted by SFA
- customer identity belongs to 52
- lead is not quote or order

# ============================================================
# 3. LEAD QUALIFICATION
# ============================================================

object_name:
- sfa_lead_qualification

required_fields:
- lead_qualification_id
- company_id
- lead_id
- qualification_method
- qualification_status
- need_summary_or_null
- budget_signal_or_null
- authority_signal_or_null
- timing_signal_or_null
- fit_score_or_null
- disqualification_reason_or_null
- qualified_at_or_null
- qualified_by_or_system_actor
- lineage_reference

qualification_method_examples:
- manual
- score_based
- BANT
- rule_based
- AI_assisted_review
- imported

allowed_qualification_status:
- pending
- qualified
- disqualified
- needs_nurture
- returned_to_crm
- cancelled
- superseded

rules:
- qualification belongs to SFA
- qualified lead may convert to opportunity
- disqualified lead does not delete CRM history

# ============================================================
# 4. OPPORTUNITY
# ============================================================

object_name:
- sfa_opportunity

meaning:
- canonical sales opportunity / pipeline object

required_fields:
- opportunity_id
- company_id
- lead_id_or_null
- master_customer_or_partner_reference_or_null
- crm_account_profile_id_or_null
- opportunity_name
- opportunity_type
- opportunity_stage
- opportunity_status
- estimated_amount
- currency_code
- probability_percent
- expected_close_date_or_null
- product_or_service_scope
- sales_owner_reference
- competitor_reference_or_null
- quote_request_reference_or_null
- converted_quote_reference_or_null
- created_at
- updated_at
- lineage_reference

opportunity_type_examples:
- new_sale
- upsell
- cross_sell
- renewal
- replacement
- reactivation
- strategic_deal

allowed_opportunity_stage:
- prospecting
- qualification
- needs_analysis
- proposal_preparation
- quote_requested
- quote_issued
- negotiation
- verbal_commit
- closed_won
- closed_lost
- cancelled
- superseded

allowed_opportunity_status:
- open
- on_hold
- won
- lost
- cancelled
- superseded

rules:
- opportunity belongs to SFA
- quote belongs to 01.sales
- accepted order belongs to 04.order-management
- opportunity amount/probability is pipeline truth, not invoice/order truth

# ============================================================
# 5. OPPORTUNITY STAGE HISTORY
# ============================================================

object_name:
- sfa_opportunity_stage_history

required_fields:
- opportunity_stage_history_id
- company_id
- opportunity_id
- from_stage_or_null
- to_stage
- changed_at
- changed_by
- change_reason_or_null
- probability_before_or_null
- probability_after_or_null
- amount_before_or_null
- amount_after_or_null
- lineage_reference

rules:
- stage history is immutable
- correction requires successor event
- BI may visualize stage duration but not change stage history

# ============================================================
# 6. SALES ACTIVITY
# ============================================================

object_name:
- sfa_sales_activity

meaning:
- sales activity linked to lead/opportunity/account

required_fields:
- sales_activity_id
- company_id
- lead_id_or_null
- opportunity_id_or_null
- crm_account_profile_id_or_null
- activity_type
- activity_channel
- activity_status
- scheduled_at_or_null
- completed_at_or_null
- activity_summary
- outcome_summary_or_null
- next_action_or_null
- sales_owner_reference
- lineage_reference

activity_type_examples:
- call
- email
- meeting
- demo
- proposal_review
- negotiation
- follow_up
- internal_review
- customer_visit
- event_contact

allowed_activity_status:
- planned
- in_progress
- completed
- cancelled
- no_show
- rescheduled
- superseded

rules:
- sales activity belongs to SFA
- CRM interaction may reference activity but CRM does not own SFA pipeline state
- activity completion does not create quote/order automatically

# ============================================================
# 7. PIPELINE FORECAST SIGNAL
# ============================================================

object_name:
- sfa_pipeline_forecast_signal

meaning:
- SFA-side forecast signal based on opportunities/pipeline

required_fields:
- pipeline_forecast_signal_id
- company_id
- opportunity_id_or_pipeline_group_reference
- period_start
- period_end
- product_or_category_reference_or_null
- region_or_channel_reference_or_null
- weighted_amount
- unweighted_amount
- expected_quantity_or_null
- quantity_uom_or_null
- probability_basis
- signal_status
- created_at
- lineage_reference

allowed_signal_status:
- draft
- calculated
- reviewed
- sent_to_demand_forecasting
- accepted_by_demand_forecasting
- rejected_by_demand_forecasting
- cancelled
- superseded

rules:
- pipeline forecast signal belongs to SFA
- demand forecast truth belongs to 06 after processing
- signal does not rewrite opportunity truth after sent

# ============================================================
# 8. OPPORTUNITY TO QUOTE REQUEST BASIS
# ============================================================

handoff_object_name:
- sfa_to_sales_quote_request_basis

meaning:
- controlled request basis from SFA opportunity to Sales quote creation

required_fields:
- quote_request_basis_id
- company_id
- source_module
- target_module
- opportunity_id
- master_customer_or_partner_reference_or_null
- crm_account_profile_id_or_null
- requested_product_or_service_scope
- requested_quantity_or_null
- quantity_uom_or_null
- requested_price_or_budget_signal_or_null
- requested_delivery_date_or_null
- commercial_context_summary
- quote_request_status
- created_at
- created_by
- lineage_reference

allowed_quote_request_status:
- building
- validation_pending
- handoff_ready
- sent_to_sales
- accepted_by_sales
- rejected_by_sales
- quote_created
- cancelled
- superseded

acceptance_requires:
- source_module = 02.sfa
- target_module = 01.sales
- opportunity_id present
- customer/account reference resolvable or prospect quote allowed
- product/service scope present
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- OPPORTUNITY_UNRESOLVABLE
- CUSTOMER_REFERENCE_UNRESOLVABLE
- PRODUCT_SCOPE_UNRESOLVABLE
- PACKAGE_NOT_READY
- MISSING_LINEAGE
- DUPLICATE_OR_SUPERSEDED_BASIS

rules:
- quote request basis is not quote
- sales owns quote after acceptance
- SFA owns opportunity and pipeline status
- quote result may update opportunity stage through SFA workflow

# ============================================================
# 9. SFA TO DEMAND FORECASTING PIPELINE SIGNAL
# ============================================================

handoff_object_name:
- sfa_to_demand_forecasting_pipeline_signal

required_fields:
- sfa_demand_signal_id
- company_id
- source_module
- target_module
- pipeline_forecast_signal_id
- opportunity_reference_set_or_group
- period_start
- period_end
- product_or_category_reference_or_null
- region_or_channel_reference_or_null
- weighted_amount
- unweighted_amount
- expected_quantity_or_null
- signal_status
- created_at
- lineage_reference

allowed_signal_status:
- building
- handoff_ready
- sent_to_demand_forecasting
- accepted_by_demand_forecasting
- rejected_by_demand_forecasting
- cancelled
- superseded

rules:
- source_module must be 02.sfa
- target_module must be 06.demand-forecasting
- signal is input only
- 06 owns resulting forecast

# ============================================================
# 10. FEEDBACK FROM SALES
# ============================================================

accepted_feedback_examples:
- sales_quote_created_from_opportunity
- sales_quote_issued
- sales_quote_accepted
- sales_quote_rejected
- sales_order_created_from_quote

rules:
- sales feedback may update opportunity stage
- SFA may not alter quote truth
- order creation may update opportunity won status through SFA workflow
- opportunity won/lost does not create invoice

# ============================================================
# 11. OUTPUT TO BI
# ============================================================

BI_consumable_outputs:
- lead snapshot
- qualification snapshot
- opportunity snapshot
- stage history snapshot
- sales activity snapshot
- pipeline forecast signal snapshot
- quote request basis snapshot

rules:
- BI visualizes pipeline
- BI does not change lead/opportunity stage
- BI does not create quote/order

# ============================================================
# 12. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- CRM candidate treated as SFA lead without SFA intake
- lead treated as customer master
- opportunity treated as quote
- quote request treated as quote
- pipeline weighted amount treated as demand forecast truth
- opportunity won treated as invoice
- BI dashboard changing opportunity stage
- demand forecast changing opportunity amount

# ============================================================
# 13. DECISION TEST
# ============================================================

decision_test:
- If it is lead/opportunity/activity/pipeline, 02 owns it.
- If it is CRM relationship/contact/interaction, 03 owns it.
- If it is quote/price/promotion, 01 owns it.
- If it is accepted order, 04 owns it.
- If it is demand forecast, 06 owns it.
- If it is shared identity, 52 owns it.

# ============================================================
# 14. COMPLETION STATE
# ============================================================

completion_state:
- SFA exact design fixed
- lead/opportunity/activity/pipeline ownership fixed
- opportunity-to-quote request basis fixed
- pipeline-to-forecast signal fixed
- BI and source boundaries preserved

# ============================================================
