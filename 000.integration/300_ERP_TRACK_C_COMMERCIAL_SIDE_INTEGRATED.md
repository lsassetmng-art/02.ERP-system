# ============================================================
# ERP TRACK C COMMERCIAL SIDE INTEGRATED
# ============================================================

status: regenerated
owner: Boss
prepared_by: Zero
generated_at: 2026-04-28 18:54:22 +0900
system: ERP
source_root: /data/data/com.termux/files/home/02.ERP-system
policy:
- additive-only
- split integrated regeneration
- module docs remain canonical source
- integrated docs are compiled references
- no DB apply
- no destructive operation
- CommonOS remains shared UI / presentation foundation only
- ERP business canon remains in ERP modules

# ============================================================
# SOURCE CONTENT
# ============================================================


# ------------------------------------------------------------
## SOURCE: 00.foundation/920.meta/9200000327_COMMERCIAL_CRM_SFA_SALES_BOUNDARY_MEMO.md
# ------------------------------------------------------------

# ============================================================
# ERP COMMERCIAL / CRM / SFA / SALES BOUNDARY MEMO EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track C
scope:
- 03.crm
- 02.sfa
- 01.sales
- 04.order-management
- 05.billing
- 06.demand-forecasting
- 52.master-data
- 60.business-intelligence

purpose:
Fix the commercial-side boundary between CRM customer relationship,
SFA lead/opportunity/pipeline, sales quote/price/promotion, accepted order,
billing, demand forecasting signals, master data, and BI projection.

# ============================================================
# 1. MODULE POSITIONS
# ============================================================

## 1.1 52.master-data
canonical_role:
- shared customer / business partner identity truth

owns_truth:
- business partner core identity
- customer core identity
- customer master identifier
- customer duplicate / merge / split
- customer common address / reference identity where common
- master publication package

does_not_own:
- CRM relationship state
- SFA opportunity state
- sales quote
- sales price condition
- sales order
- invoice
- demand forecast
- BI dashboard projection

## 1.2 03.crm
canonical_role:
- customer relationship / account / contact / interaction extension truth

owns_truth:
- CRM account profile extension
- contact relationship profile
- customer relationship status
- customer interaction history
- customer preference where relationship-side
- customer segment where CRM-owned
- customer issue / inquiry / case where CRM-side
- CRM-to-SFA lead/opportunity candidate handoff
- CRM customer extension linked to master customer identity

does_not_own:
- shared customer master identity
- SFA opportunity pipeline truth
- sales quote truth
- accepted sales order truth
- invoice truth
- demand forecast truth
- BI projection truth

## 1.3 02.sfa
canonical_role:
- lead / opportunity / sales activity / pipeline truth

owns_truth:
- lead
- lead qualification
- opportunity
- opportunity stage
- sales activity
- pipeline forecast
- opportunity amount/probability
- opportunity-to-quote request basis
- sales forecast signal where SFA-side

does_not_own:
- shared customer master identity
- CRM relationship master profile
- issued quote truth
- accepted sales order truth
- invoice truth
- demand forecast truth
- BI projection truth

## 1.4 01.sales
canonical_role:
- sales quote / price / discount / promotion / commercial pre-order truth

owns_truth:
- sales quote
- quote line
- sales price condition
- discount condition
- promotion condition
- sales commercial terms
- quote approval package
- quote revision
- sales-to-order authorized order basis
- sales promotion signal to demand forecasting

does_not_own:
- CRM relationship truth
- SFA opportunity truth
- accepted sales order truth
- invoice truth
- shared customer identity truth
- demand forecast truth
- BI projection truth

## 1.5 04.order-management
canonical_role:
- accepted customer order / fulfillment orchestration truth

relationship:
- consumes sales-to-order authorized basis from 01.sales
- owns accepted order after intake
- does not own quote or CRM/SFA truth

## 1.6 05.billing
canonical_role:
- invoice / billing truth

relationship:
- consumes order/billing basis according to billing policy
- does not own quote, opportunity, CRM relationship, or delivery truth

## 1.7 06.demand-forecasting
canonical_role:
- market-side demand forecast truth

relationship:
- may consume promotion signal, pipeline signal, opportunity signal, and sales history
- does not own CRM/SFA/sales source truth

## 1.8 60.business-intelligence
canonical_role:
- analytical projection truth only

relationship:
- may visualize CRM/SFA/sales pipeline/quote/order/billing signals
- may not mutate source truth

# ============================================================
# 2. CANONICAL COMMERCIAL FLOW
# ============================================================

canonical_flow:
- 52.master-data
- -> 03.crm
- -> 02.sfa
- -> 01.sales
- -> 04.order-management
- -> 05.billing
- -> 30.accounting
- -> 60.business-intelligence

signal_flow_to_forecast:
- 03.crm / 02.sfa / 01.sales / 04.order-management / 05.billing
- -> 06.demand-forecasting as input signals only

flow_meaning:
- 52 defines shared customer identity.
- 03 manages relationship and interaction.
- 02 manages lead/opportunity/pipeline.
- 01 creates quote, price, discount, promotion, and order basis.
- 04 accepts and orchestrates customer order.
- 05 invoices.
- 06 forecasts demand using approved source signals.
- 60 visualizes only.

# ============================================================
# 3. OWNERSHIP MATRIX
# ============================================================

| concept | owner_module | note |
|---|---|---|
| customer core identity | 52.master-data | shared identity |
| CRM account profile | 03.crm | relationship extension |
| contact relationship | 03.crm | CRM-side contact truth |
| customer interaction | 03.crm | interaction truth |
| lead | 02.sfa | sales funnel truth |
| opportunity | 02.sfa | opportunity/pipeline truth |
| sales activity | 02.sfa | SFA activity truth |
| pipeline forecast signal | 02.sfa | SFA-side signal, not demand forecast truth |
| sales quote | 01.sales | pre-order commercial truth |
| sales price condition | 01.sales | quote/sales commercial truth |
| sales promotion condition | 01.sales | promotion condition truth |
| accepted sales order | 04.order-management | order truth |
| invoice | 05.billing | billing truth |
| demand forecast | 06.demand-forecasting | market-side forecast truth |
| dashboard projection | 60.business-intelligence | projection only |

# ============================================================
# 4. HANDOFF CHAIN
# ============================================================

handoff_chain:
- master_to_crm_customer_reference_publication
- crm_to_sfa_lead_or_opportunity_candidate
- sfa_to_sales_quote_request_basis
- sales_to_order_authorized_order_basis
- sales_to_demand_forecasting_promotion_signal
- sfa_to_demand_forecasting_pipeline_signal
- source_modules_to_bi_snapshot

rules:
- 52 to 03 transfers customer identity/reference, not CRM relationship ownership.
- 03 to 02 transfers candidate/signal, not SFA opportunity ownership.
- 02 to 01 transfers quote request basis, not quote ownership.
- 01 to 04 transfers authorized order basis, not order ownership.
- 01/02/03 may emit forecast input signals, but 06 owns demand forecast truth.
- 60 consumes snapshots only.

# ============================================================
# 5. FORECAST SIGNAL RULE
# ============================================================

forecast_signal_rule:
- CRM/SFA/Sales signals are inputs to demand forecasting.
- Signals do not become forecast truth until 06 processes them.
- Forecast output does not rewrite CRM/SFA/Sales source records.
- Promotion signal may affect forecast scenarios but does not change promotion truth.
- Pipeline signal may inform forecast but does not change opportunity truth.

# ============================================================
# 6. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- CRM account profile creating shared customer identity without 52 workflow
- SFA lead treated as customer master
- opportunity treated as quote
- quote treated as accepted order without 04 intake
- promotion signal treated as demand forecast truth
- pipeline probability treated as S&OP consensus truth
- billing invoice changing quote price condition directly
- BI dashboard changing CRM/SFA/Sales status
- demand forecast overwriting opportunity amount
- master merge silently rewriting CRM/SFA/Sales history without lineage

# ============================================================
# 7. DECISION TEST
# ============================================================

decision_tests:
- If it is shared customer/business partner identity, 52.master-data owns it.
- If it is relationship/account/contact/interaction, 03.crm owns it.
- If it is lead/opportunity/activity/pipeline, 02.sfa owns it.
- If it is quote/price/discount/promotion/pre-order condition, 01.sales owns it.
- If it is accepted order, 04.order-management owns it.
- If it is invoice, 05.billing owns it.
- If it is forecast, 06.demand-forecasting owns it.
- If it is dashboard projection, 60.business-intelligence owns it.

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- commercial-side boundary fixed
- CRM/SFA/Sales ownership separated
- customer master boundary preserved
- forecast signal boundary fixed
- BI projection boundary preserved

# ============================================================


# ------------------------------------------------------------
## SOURCE: 03.crm/920.meta/9203000001_CRM_CUSTOMER_ACCOUNT_CONTACT_INTERACTION_EXACT_DESIGN.md
# ------------------------------------------------------------

# ============================================================
# CRM CUSTOMER / ACCOUNT / CONTACT / INTERACTION EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 03.crm
track: Track C
related_modules:
- 52.master-data
- 02.sfa
- 01.sales
- 05.billing
- 06.demand-forecasting
- 60.business-intelligence

purpose:
Define CRM truth for customer relationship extension, account profile,
contact relationship, interaction history, preference, case/inquiry,
and handoff to SFA without owning shared customer master identity.

canonical_role:
- customer relationship / account / contact / interaction extension truth

# ============================================================
# 1. CORE CRM OBJECTS
# ============================================================

core_objects:
- crm_customer_master_reference_intake
- crm_account_profile
- crm_contact_profile
- crm_account_contact_relationship
- crm_customer_relationship_status
- crm_customer_segment_assignment
- crm_customer_preference
- crm_interaction
- crm_case_or_inquiry
- crm_engagement_score
- crm_to_sfa_lead_candidate
- crm_to_demand_forecasting_customer_signal
- crm_to_bi_snapshot

# ============================================================
# 2. CUSTOMER MASTER REFERENCE INTAKE
# ============================================================

accepted_input_object:
- master_to_crm_customer_reference_publication

meaning:
- customer/business-partner master identity publication from 52.master-data

required_fields:
- crm_master_reference_intake_id
- company_id
- source_module
- target_module
- master_record_id
- master_domain
- master_version_id
- customer_or_business_partner_code
- customer_or_business_partner_name
- effective_from
- effective_to_or_null
- intake_status
- received_at
- lineage_reference

allowed_intake_status:
- received
- validated
- accepted
- rejected
- held_for_review
- superseded

acceptance_requires:
- source_module = 52.master-data
- target_module = 03.crm
- master_record_id present
- master_domain in business_partner_core/customer_core
- lineage_reference present

rules:
- CRM consumes master identity
- CRM does not create competing shared identity
- CRM extension must reference master_record_id

# ============================================================
# 3. CRM ACCOUNT PROFILE
# ============================================================

object_name:
- crm_account_profile

meaning:
- CRM-side account relationship extension for a customer/business partner

required_fields:
- crm_account_profile_id
- company_id
- master_customer_or_partner_id
- account_owner_reference_or_null
- account_status
- relationship_stage
- customer_segment_reference_or_null
- industry_or_category_or_null
- account_priority
- primary_contact_reference_or_null
- preferred_channel_or_null
- relationship_start_date_or_null
- relationship_end_date_or_null
- created_at
- updated_at
- lineage_reference

allowed_account_status:
- prospect
- active
- inactive
- dormant
- blocked_for_crm
- churned
- merged_reference
- cancelled
- superseded

relationship_stage_examples:
- unknown
- prospecting
- engaged
- active_customer
- growth
- retention
- at_risk
- lost
- reactivation

rules:
- CRM account profile belongs to 03
- shared identity belongs to 52
- sales quote belongs to 01
- opportunity belongs to 02
- invoice belongs to 05

# ============================================================
# 4. CONTACT PROFILE / RELATIONSHIP
# ============================================================

object_name:
- crm_contact_profile

meaning:
- CRM-side contact profile related to a customer/account

required_fields:
- crm_contact_profile_id
- company_id
- master_contact_or_person_reference_or_null
- display_name
- contact_role_or_title_or_null
- email_reference_or_null
- phone_reference_or_null
- preferred_contact_channel_or_null
- contact_status
- created_at
- updated_at
- lineage_reference

allowed_contact_status:
- active
- inactive
- do_not_contact
- left_company
- merged_reference
- cancelled
- superseded

object_name:
- crm_account_contact_relationship

required_fields:
- account_contact_relationship_id
- company_id
- crm_account_profile_id
- crm_contact_profile_id
- relationship_role
- decision_influence_level_or_null
- effective_from
- effective_to_or_null
- relationship_status
- lineage_reference

relationship_role_examples:
- decision_maker
- influencer
- user
- approver
- billing_contact
- technical_contact
- operations_contact
- unknown

allowed_relationship_status:
- active
- inactive
- ended
- cancelled
- superseded

rules:
- contact relationship belongs to CRM
- master identity/reference belongs to 52 where common
- billing contact usage belongs to 05.billing if billing-specific

# ============================================================
# 5. RELATIONSHIP STATUS / SEGMENT / PREFERENCE
# ============================================================

object_name:
- crm_customer_relationship_status

required_fields:
- relationship_status_id
- company_id
- crm_account_profile_id
- status_code
- status_reason_or_null
- effective_from
- effective_to_or_null
- updated_by
- lineage_reference

status_code_examples:
- active
- engaged
- at_risk
- dormant
- churned
- blocked
- reactivation_target

object_name:
- crm_customer_segment_assignment

required_fields:
- segment_assignment_id
- company_id
- crm_account_profile_id
- segment_code
- segment_source
- assignment_status
- effective_from
- effective_to_or_null
- lineage_reference

segment_source_examples:
- manual
- rule_based
- campaign_based
- analytics_suggested
- imported

object_name:
- crm_customer_preference

required_fields:
- customer_preference_id
- company_id
- crm_account_profile_id
- preference_type
- preference_value
- preference_source
- effective_from
- effective_to_or_null
- preference_status
- lineage_reference

preference_type_examples:
- contact_channel
- product_interest
- communication_frequency
- language
- delivery_preference_signal
- campaign_opt_in
- do_not_contact

rules:
- CRM preference is relationship-side
- billing/payment preference belongs to 05 if billing-specific
- logistics delivery execution preference belongs to 14 when execution-specific
- master identity fields remain 52

# ============================================================
# 6. CRM INTERACTION
# ============================================================

object_name:
- crm_interaction

meaning:
- CRM-side interaction/contact event with customer/account/contact

required_fields:
- crm_interaction_id
- company_id
- crm_account_profile_id
- crm_contact_profile_id_or_null
- interaction_type
- interaction_channel
- interaction_at
- interaction_summary
- interaction_outcome
- related_campaign_or_promotion_reference_or_null
- related_lead_or_opportunity_reference_or_null
- next_action_reference_or_null
- recorded_by
- lineage_reference

interaction_type_examples:
- call
- email
- meeting
- chat
- visit
- campaign_response
- inquiry
- complaint
- follow_up
- survey_response

interaction_channel_examples:
- phone
- email
- in_person
- web
- app
- chat
- event
- store
- social
- other

rules:
- interaction belongs to CRM
- interaction may generate SFA lead candidate
- interaction may signal demand forecasting
- interaction does not create quote/order/invoice by itself

# ============================================================
# 7. CRM CASE / INQUIRY
# ============================================================

object_name:
- crm_case_or_inquiry

required_fields:
- crm_case_id
- company_id
- crm_account_profile_id
- crm_contact_profile_id_or_null
- case_type
- case_priority
- case_status
- case_summary
- source_interaction_id_or_null
- related_order_reference_or_null
- related_invoice_reference_or_null
- opened_at
- closed_at_or_null
- owner_reference_or_null
- lineage_reference

case_type_examples:
- inquiry
- complaint
- product_question
- billing_question
- delivery_question
- service_request
- support_request
- feedback

allowed_case_status:
- open
- in_progress
- waiting_customer
- waiting_internal
- resolved
- closed
- cancelled
- superseded

rules:
- CRM case belongs to 03 when relationship/customer-service-side
- billing correction belongs to 05
- delivery correction belongs to 14
- order correction belongs to 04

# ============================================================
# 8. CRM TO SFA LEAD CANDIDATE
# ============================================================

handoff_object_name:
- crm_to_sfa_lead_candidate

meaning:
- CRM-side candidate signal for SFA lead/opportunity processing

required_fields:
- crm_sfa_candidate_id
- company_id
- source_module
- target_module
- crm_account_profile_id
- crm_contact_profile_id_or_null
- interaction_reference_set_or_null
- candidate_type
- candidate_summary
- product_or_service_interest_or_null
- estimated_need_date_or_null
- candidate_score_or_null
- candidate_status
- created_at
- lineage_reference

candidate_type_examples:
- new_lead
- upsell_candidate
- cross_sell_candidate
- renewal_candidate
- reactivation_candidate
- opportunity_candidate

allowed_candidate_status:
- building
- handoff_ready
- sent_to_sfa
- accepted_by_sfa
- rejected_by_sfa
- cancelled
- superseded

rules:
- source_module must be 03.crm
- target_module must be 02.sfa
- candidate is not SFA lead/opportunity until accepted by 02
- SFA rejection does not delete CRM interaction

# ============================================================
# 9. CRM TO DEMAND FORECASTING SIGNAL
# ============================================================

handoff_object_name:
- crm_to_demand_forecasting_customer_signal

meaning:
- CRM relationship/customer signal that demand forecasting may consume

required_fields:
- crm_forecast_signal_id
- company_id
- source_module
- target_module
- crm_account_profile_id_or_segment_reference
- signal_type
- signal_period_start_or_null
- signal_period_end_or_null
- product_or_category_reference_or_null
- region_or_channel_reference_or_null
- signal_strength_or_quantity_or_null
- signal_summary
- signal_status
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

allowed_signal_status:
- building
- handoff_ready
- sent_to_demand_forecasting
- accepted_by_demand_forecasting
- rejected_by_demand_forecasting
- superseded
- cancelled

rules:
- source_module must be 03.crm
- target_module must be 06.demand-forecasting
- signal is forecast input only
- 06 owns forecast truth after processing

# ============================================================
# 10. OUTPUT TO BI
# ============================================================

BI_consumable_outputs:
- CRM account profile snapshot
- contact relationship snapshot
- interaction snapshot
- case/inquiry snapshot
- CRM-to-SFA candidate snapshot
- CRM forecast signal snapshot
- customer segment snapshot

rules:
- BI visualizes CRM data
- BI does not mutate CRM state
- BI customer dimension changes do not correct 52 master or 03 CRM truth

# ============================================================
# 11. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- CRM account profile creating customer master identity outside 52
- CRM interaction directly becoming SFA opportunity without SFA intake
- CRM case directly changing invoice/order/delivery source truth
- CRM forecast signal treated as demand forecast truth
- BI dashboard changing relationship status
- master merge silently rewriting CRM history without lineage

# ============================================================
# 12. DECISION TEST
# ============================================================

decision_test:
- If it is customer relationship/account/contact/interaction/case, 03 owns it.
- If it is shared customer identity, 52 owns it.
- If it is lead/opportunity/pipeline, 02 owns it.
- If it is quote/price/promotion, 01 owns it.
- If it is invoice, 05 owns it.
- If it is demand forecast, 06 owns it.

# ============================================================
# 13. COMPLETION STATE
# ============================================================

completion_state:
- CRM exact design fixed
- customer master reference intake fixed
- account/contact/interaction/case ownership fixed
- CRM-to-SFA and CRM-to-forecast signals fixed
- BI and master-data boundaries preserved

# ============================================================


# ------------------------------------------------------------
## SOURCE: 02.sfa/920.meta/9202000001_SFA_LEAD_OPPORTUNITY_ACTIVITY_PIPELINE_EXACT_DESIGN.md
# ------------------------------------------------------------

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


# ------------------------------------------------------------
## SOURCE: 01.sales/920.meta/9201000001_SALES_TO_ORDER_MANAGEMENT_BOUNDARY_EXACT.md
# ------------------------------------------------------------

# ============================================================
# SALES TO ORDER MANAGEMENT BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 01.sales
consumer_module: 04.order-management

purpose:
Define sales quote, sales condition, and authorized order basis handoff to
order management without transferring accepted order ownership to sales.

canonical_role:
- sales quote / sales commercial condition / pre-order truth

# ============================================================
# 1. CORE SALES OBJECTS
# ============================================================

core_objects:
- sales_quote
- sales_quote_line
- sales_price_condition
- sales_discount_condition
- sales_commercial_terms
- sales_quote_approval_package
- customer_purchase_intent_evidence
- sales_to_order_authorized_order_basis

# ============================================================
# 2. SALES QUOTE
# ============================================================

object_name:
- sales_quote

meaning:
- canonical pre-order offer or quote to customer

required_fields:
- sales_quote_id
- company_id
- customer_id
- quote_number
- quote_status
- quote_date
- valid_from
- valid_until
- currency_code
- sales_channel_or_null
- sales_person_or_role_reference
- quote_line_set
- price_condition_reference_set
- discount_condition_reference_set
- commercial_terms_reference
- approval_reference_or_null
- customer_acceptance_evidence_or_null
- created_at
- created_by
- updated_at
- updated_by
- lineage_reference

allowed_quote_status:
- draft
- review_pending
- approved
- issued
- accepted_by_customer
- rejected_by_customer
- expired
- converted_to_order
- cancelled
- superseded

rules:
- quote is not accepted sales order
- accepted_by_customer may become order basis
- converted_to_order requires handoff to 04.order-management
- quote correction requires new quote version or supersession after issue

# ============================================================
# 3. SALES QUOTE LINE
# ============================================================

object_name:
- sales_quote_line

required_fields:
- sales_quote_line_id
- sales_quote_id
- line_number
- item_id_or_service_id
- proposed_quantity
- quantity_uom
- proposed_unit_price
- currency_code
- discount_reference_or_null
- tax_condition_reference_or_null
- requested_delivery_date_or_null
- fulfillment_location_preference_or_null
- line_status
- lineage_reference

allowed_line_status:
- draft
- approved
- issued
- accepted
- rejected
- expired
- converted_to_order
- cancelled
- superseded

rules:
- proposed quantity is not order quantity until accepted into 04
- proposed price is sales condition basis, not invoice truth
- billing amount is determined by 05.billing under billing policy

# ============================================================
# 4. AUTHORIZED ORDER BASIS HANDOFF
# ============================================================

handoff_object_name:
- sales_to_order_authorized_order_basis

meaning:
- approved / accepted sales basis for creating or updating customer order

required_fields:
- authorized_order_basis_id
- company_id
- source_module
- target_module
- sales_quote_id
- customer_id
- customer_acceptance_evidence_reference
- commercial_terms_reference
- price_condition_reference_set
- discount_condition_reference_set
- quote_line_basis_set
- requested_fulfillment_reference_or_null
- approval_reference_or_null
- package_status
- created_at
- created_by
- lineage_reference

quote_line_basis_required_fields:
- quote_line_basis_id
- sales_quote_line_id
- item_id_or_service_id
- accepted_quantity
- quantity_uom
- accepted_unit_price_or_condition_reference
- requested_delivery_date_or_null
- fulfillment_note_or_null

allowed_package_status:
- building
- validation_pending
- handoff_ready
- handed_off
- accepted_by_order_management
- rejected_by_order_management
- superseded
- cancelled

rules:
- source_module must be 01.sales
- target_module must be 04.order-management
- only handoff_ready may be accepted by 04
- accepted handoff may create sales order
- handoff itself is not sales order

# ============================================================
# 5. ORDER MANAGEMENT ACCEPTANCE / REJECTION
# ============================================================

order_acceptance_requires:
- customer_id present
- customer acceptance evidence present
- quote line basis exists
- item / service scope resolvable
- price / terms basis resolvable
- package_status = handoff_ready
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- CUSTOMER_UNRESOLVABLE
- CUSTOMER_ACCEPTANCE_MISSING
- ITEM_SCOPE_UNRESOLVABLE
- PRICE_CONDITION_UNRESOLVABLE
- TERMS_UNRESOLVABLE
- PACKAGE_NOT_READY
- MISSING_LINEAGE
- DUPLICATE_OR_SUPERSEDED_BASIS

rules:
- rejection does not delete sales quote
- sales may issue corrected successor basis
- order management may not rewrite quote truth directly

# ============================================================
# 6. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- quote accepted status treated as sales order without 04 intake
- quote line quantity treated as inventory allocation
- quote price treated as invoice amount without billing policy
- order management editing quote approval in place
- BI dashboard approving quote conversion
- audit finding converting quote to order directly

# ============================================================
# 7. DECISION TEST
# ============================================================

decision_test:
- If it is quote / selling condition / customer pre-order acceptance basis, 01 owns it.
- If it is accepted customer order and fulfillment orchestration, 04 owns it.
- If it is invoice, 05 owns it.

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- sales quote truth fixed
- sales to order handoff fixed
- order acceptance / rejection baseline fixed
- quote vs order boundary fixed

# ============================================================


# ------------------------------------------------------------
## SOURCE: 01.sales/920.meta/9201000002_SALES_PRICE_DISCOUNT_PROMOTION_QUOTE_EXACT_DESIGN.md
# ------------------------------------------------------------

# ============================================================
# SALES PRICE / DISCOUNT / PROMOTION / QUOTE EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 01.sales
track: Track C
related_modules:
- 02.sfa
- 03.crm
- 04.order-management
- 05.billing
- 06.demand-forecasting
- 52.master-data
- 60.business-intelligence

purpose:
Define sales truth for price condition, discount condition, promotion,
quote, quote revision, quote approval, quote-to-order basis, and promotion
signal to demand forecasting.

canonical_role:
- sales quote / price / discount / promotion / commercial pre-order truth

# ============================================================
# 1. CORE SALES OBJECTS
# ============================================================

core_objects:
- sales_quote_request_intake
- sales_price_condition
- sales_discount_condition
- sales_promotion
- sales_promotion_condition
- sales_quote
- sales_quote_line
- sales_quote_revision
- sales_quote_approval_package
- sales_commercial_terms
- sales_to_order_authorized_order_basis
- sales_to_demand_forecasting_promotion_signal
- sales_to_bi_snapshot

# ============================================================
# 2. QUOTE REQUEST INTAKE
# ============================================================

accepted_input_object:
- sfa_to_sales_quote_request_basis

object_name:
- sales_quote_request_intake

required_fields:
- quote_request_intake_id
- company_id
- source_module
- target_module
- quote_request_basis_id
- opportunity_id_or_null
- customer_or_partner_reference_or_null
- crm_account_profile_id_or_null
- requested_product_or_service_scope
- requested_quantity_or_null
- quantity_uom_or_null
- commercial_context_summary
- intake_status
- received_at
- lineage_reference

allowed_intake_status:
- received
- validation_pending
- accepted
- rejected
- quote_created
- cancelled
- superseded

acceptance_requires:
- source_module = 02.sfa
- target_module = 01.sales
- product/service scope resolvable
- customer/prospect reference policy valid
- lineage_reference present

rules:
- quote request is not quote
- sales owns quote after intake
- SFA owns opportunity

# ============================================================
# 3. SALES PRICE CONDITION
# ============================================================

object_name:
- sales_price_condition

meaning:
- sales-side price basis before order/billing

required_fields:
- price_condition_id
- company_id
- condition_code
- condition_name
- condition_type
- item_or_category_reference_or_null
- customer_or_segment_reference_or_null
- channel_reference_or_null
- region_reference_or_null
- currency_code
- price_amount_or_formula_reference
- effective_from
- effective_to_or_null
- priority
- condition_status
- approval_reference_or_null
- lineage_reference

condition_type_examples:
- list_price
- customer_specific_price
- segment_price
- channel_price
- campaign_price
- contract_price
- manual_quote_price
- formula_price

allowed_condition_status:
- draft
- approval_pending
- active
- inactive
- superseded
- cancelled

rules:
- sales price condition belongs to 01
- invoice amount belongs to 05 after billing workflow
- item identity belongs to 52.master-data
- BI may visualize price but cannot change it

# ============================================================
# 4. SALES DISCOUNT CONDITION
# ============================================================

object_name:
- sales_discount_condition

required_fields:
- discount_condition_id
- company_id
- discount_code
- discount_name
- discount_type
- discount_value_or_formula_reference
- item_or_category_reference_or_null
- customer_or_segment_reference_or_null
- channel_reference_or_null
- region_reference_or_null
- effective_from
- effective_to_or_null
- combinability_rule_reference_or_null
- priority
- condition_status
- approval_reference_or_null
- lineage_reference

discount_type_examples:
- percentage
- fixed_amount
- volume_discount
- customer_discount
- campaign_discount
- manual_quote_discount
- bundle_discount
- early_order_discount

rules:
- discount condition belongs to 01
- discount applied to quote is quote truth
- billing may consume quote/order basis but does not own source discount condition

# ============================================================
# 5. SALES PROMOTION
# ============================================================

object_name:
- sales_promotion

meaning:
- sales-side commercial promotion definition

required_fields:
- promotion_id
- company_id
- promotion_code
- promotion_name
- promotion_type
- target_item_or_category_reference_set
- target_customer_or_segment_reference_set_or_null
- target_channel_reference_set_or_null
- target_region_reference_set_or_null
- promotion_start_at
- promotion_end_at
- promotion_budget_or_null
- promotion_status
- approval_reference_or_null
- created_at
- lineage_reference

promotion_type_examples:
- price_promotion
- discount_campaign
- bundle_campaign
- coupon
- loyalty_offer
- launch_promotion
- clearance
- seasonal_campaign

allowed_promotion_status:
- draft
- approval_pending
- approved
- active
- paused
- completed
- cancelled
- superseded

rules:
- promotion belongs to sales
- promotion signal may be sent to demand forecasting
- demand forecasting does not own promotion truth
- billing does not own promotion definition

# ============================================================
# 6. PROMOTION CONDITION
# ============================================================

object_name:
- sales_promotion_condition

required_fields:
- promotion_condition_id
- company_id
- promotion_id
- condition_type
- condition_value_or_formula_reference
- eligibility_rule_reference
- benefit_rule_reference
- usage_limit_or_null
- combinability_rule_reference_or_null
- condition_status
- lineage_reference

condition_type_examples:
- discount
- price_override
- buy_x_get_y
- bundle
- coupon
- points
- free_shipping_signal
- rebate_signal

rules:
- promotion condition belongs to 01
- logistics free-shipping execution/cost handling belongs to relevant downstream modules
- rebate accounting/cash handling must go through finance modules if applicable

# ============================================================
# 7. SALES QUOTE
# ============================================================

object_name:
- sales_quote

meaning:
- canonical pre-order customer offer

required_fields:
- sales_quote_id
- company_id
- customer_or_prospect_reference
- crm_account_profile_id_or_null
- opportunity_id_or_null
- quote_number
- quote_status
- quote_date
- valid_from
- valid_until
- currency_code
- quote_line_set
- price_condition_reference_set
- discount_condition_reference_set_or_null
- promotion_reference_set_or_null
- commercial_terms_reference
- approval_reference_or_null
- customer_acceptance_evidence_or_null
- revision_number
- created_at
- updated_at
- lineage_reference

allowed_quote_status:
- draft
- pricing_review
- approval_pending
- approved
- issued
- revised
- accepted_by_customer
- rejected_by_customer
- expired
- converted_to_order
- cancelled
- superseded

rules:
- quote belongs to 01
- quote is not accepted order
- quote acceptance may create order basis
- quote conversion requires 04.order-management intake

# ============================================================
# 8. SALES QUOTE LINE
# ============================================================

object_name:
- sales_quote_line

required_fields:
- sales_quote_line_id
- sales_quote_id
- line_number
- item_id_or_service_id
- quoted_quantity
- quantity_uom
- base_price_condition_reference_or_null
- applied_discount_reference_set_or_null
- applied_promotion_reference_set_or_null
- quoted_unit_price
- quoted_line_amount
- currency_code
- requested_delivery_date_or_null
- fulfillment_note_or_null
- line_status
- lineage_reference

allowed_line_status:
- draft
- priced
- approved
- issued
- accepted
- rejected
- converted_to_order
- cancelled
- superseded

rules:
- quote line is sales truth
- order line is 04 truth after order intake
- invoice line is 05 truth after billing
- item identity is 52 truth

# ============================================================
# 9. QUOTE REVISION
# ============================================================

object_name:
- sales_quote_revision

required_fields:
- quote_revision_id
- company_id
- sales_quote_id
- from_revision_number
- to_revision_number
- revision_reason
- changed_field_summary
- previous_quote_snapshot_reference
- new_quote_snapshot_reference
- revised_at
- revised_by
- approval_required_flag
- lineage_reference

rules:
- revision history is immutable
- issued quote correction requires revision/supersession
- accepted quote cannot be silently rewritten after order conversion

# ============================================================
# 10. QUOTE APPROVAL PACKAGE
# ============================================================

object_name:
- sales_quote_approval_package

required_fields:
- quote_approval_package_id
- company_id
- sales_quote_id
- approval_scope
- margin_check_reference_or_null
- discount_exception_reference_or_null
- promotion_exception_reference_or_null
- commercial_risk_summary_or_null
- approval_request_reference_or_null
- package_status
- created_at
- lineage_reference

approval_scope_examples:
- discount_exception
- price_override
- margin_exception
- nonstandard_terms
- strategic_deal
- manual_quote_approval

allowed_package_status:
- building
- approval_pending
- approved
- rejected
- returned
- cancelled
- superseded

rules:
- approval decision belongs to 50.approval
- quote state transition belongs to 01.sales
- approval does not create order

# ============================================================
# 11. SALES TO ORDER AUTHORIZED ORDER BASIS
# ============================================================

handoff_object_name:
- sales_to_order_authorized_order_basis

required_fields:
- authorized_order_basis_id
- company_id
- source_module
- target_module
- sales_quote_id
- quote_revision_number
- customer_or_partner_reference
- customer_acceptance_evidence_reference
- commercial_terms_reference
- price_condition_reference_set
- discount_condition_reference_set_or_null
- promotion_reference_set_or_null
- quote_line_basis_set
- package_status
- created_at
- lineage_reference

allowed_package_status:
- building
- validation_pending
- handoff_ready
- sent_to_order_management
- accepted_by_order_management
- rejected_by_order_management
- order_created
- cancelled
- superseded

rules:
- source_module must be 01.sales
- target_module must be 04.order-management
- handoff basis is not order
- 04 owns accepted order after intake
- 01 keeps quote lineage

# ============================================================
# 12. SALES TO DEMAND FORECASTING PROMOTION SIGNAL
# ============================================================

handoff_object_name:
- sales_to_demand_forecasting_promotion_signal

required_fields:
- promotion_forecast_signal_id
- company_id
- source_module
- target_module
- promotion_id
- promotion_condition_reference_set
- target_item_or_category_reference_set
- target_customer_or_segment_reference_set_or_null
- target_channel_reference_set_or_null
- target_region_reference_set_or_null
- promotion_start_at
- promotion_end_at
- expected_lift_or_effect_reference_or_null
- promotion_budget_or_null
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
- source_module must be 01.sales
- target_module must be 06.demand-forecasting
- promotion signal is forecast input only
- 06 owns forecast result
- signal acceptance does not change promotion definition

# ============================================================
# 13. OUTPUT TO BI
# ============================================================

BI_consumable_outputs:
- price condition snapshot
- discount condition snapshot
- promotion snapshot
- quote snapshot
- quote line snapshot
- quote revision snapshot
- quote approval package snapshot
- quote-to-order handoff status snapshot

rules:
- BI visualizes sales commercial data
- BI does not approve price/discount/promotion
- BI does not convert quote to order

# ============================================================
# 14. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- opportunity quote request treated as quote
- quote treated as order without 04 intake
- promotion signal treated as demand forecast truth
- invoice correcting quote price directly
- BI dashboard changing discount condition
- demand forecast changing promotion definition
- quote acceptance creating invoice without order/billing workflow

# ============================================================
# 15. DECISION TEST
# ============================================================

decision_test:
- If it is quote/price/discount/promotion/commercial terms, 01 owns it.
- If it is opportunity/pipeline, 02 owns it.
- If it is CRM relationship, 03 owns it.
- If it is accepted order, 04 owns it.
- If it is invoice, 05 owns it.
- If it is forecast, 06 owns it.
- If it is shared customer/item identity, 52 owns it.

# ============================================================
# 16. COMPLETION STATE
# ============================================================

completion_state:
- sales commercial exact design fixed
- price/discount/promotion/quote ownership fixed
- quote-to-order handoff fixed
- promotion-to-demand-forecast signal fixed
- BI/source boundaries preserved

# ============================================================


# ------------------------------------------------------------
## SOURCE: 00.foundation/920.meta/9200000328_COMMERCIAL_DETAILED_HANDOFF_REINFORCEMENT_MEMO.md
# ------------------------------------------------------------

# ============================================================
# ERP COMMERCIAL DETAILED HANDOFF REINFORCEMENT MEMO
# CRM / SFA / SALES / DEMAND / ORDER / BILLING
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track C
scope:
- 03.crm
- 02.sfa
- 01.sales
- 06.demand-forecasting
- 04.order-management
- 05.billing
- 52.master-data
- 60.business-intelligence

purpose:
Reinforce detailed handoff boundaries from CRM/SFA/Sales to demand forecasting,
order management, and billing so relationship, pipeline, quote, order, invoice,
and forecast truth do not drift.

# ============================================================
# 1. CORE PRINCIPLE
# ============================================================

core_principle:
- 52.master-data owns shared customer / business partner identity.
- 03.crm owns relationship / account / contact / interaction truth.
- 02.sfa owns lead / opportunity / activity / pipeline truth.
- 01.sales owns quote / price / discount / promotion / commercial pre-order truth.
- 06.demand-forecasting owns demand forecast truth.
- 04.order-management owns accepted order / fulfillment orchestration truth.
- 05.billing owns invoice / billing truth.
- 60.business-intelligence owns analytical projection only.

# ============================================================
# 2. DETAILED HANDOFFS COVERED
# ============================================================

handoffs:
- crm_to_sfa_lead_candidate
- crm_to_demand_forecasting_customer_signal
- sfa_to_sales_quote_request_basis
- sfa_to_demand_forecasting_pipeline_signal
- sales_to_demand_forecasting_promotion_signal
- sales_to_order_authorized_order_basis
- order_to_sales_conversion_feedback
- order_to_sfa_win_loss_feedback
- billing_to_sales_invoice_feedback
- billing_to_crm_customer_billing_signal
- source_modules_to_bi_snapshot

# ============================================================
# 3. HANDOFF MEANING
# ============================================================

handoff_meaning:
- CRM-to-SFA candidate is not SFA lead until SFA accepts it.
- SFA-to-Sales quote request is not a quote until Sales accepts it and creates quote.
- Sales-to-Order authorized order basis is not an accepted order until Order Management accepts it.
- CRM/SFA/Sales forecast signals are not demand forecast truth until 06 processes them.
- Billing feedback may update commercial visibility, but it does not rewrite quote/opportunity/CRM truth directly.
- BI snapshots do not mutate source states.

# ============================================================
# 4. OWNERSHIP MATRIX
# ============================================================

| object / meaning | owner_module | note |
|---|---|---|
| CRM account / contact / interaction | 03.crm | relationship truth |
| lead / opportunity / pipeline | 02.sfa | SFA truth |
| quote / price / discount / promotion | 01.sales | commercial pre-order truth |
| demand forecast | 06.demand-forecasting | forecast truth |
| accepted order | 04.order-management | order truth |
| invoice / billing adjustment | 05.billing | billing truth |
| customer identity | 52.master-data | shared identity |
| dashboard / KPI | 60.business-intelligence | projection only |

# ============================================================
# 5. FORECAST SIGNAL RULE
# ============================================================

forecast_signal_rule:
- A signal is source evidence, not forecast truth.
- 06 may accept, reject, weight, transform, or ignore commercial signals.
- 06 must preserve source lineage.
- 06 must not rewrite CRM/SFA/Sales source objects.
- Source modules may receive forecast feedback only as insight, not forced source correction.

# ============================================================
# 6. ORDER / BILLING FEEDBACK RULE
# ============================================================

order_billing_feedback_rule:
- Order conversion feedback may update quote conversion status in 01.sales.
- Order conversion feedback may update opportunity stage in 02.sfa.
- Order conversion feedback may update CRM relationship context in 03.crm.
- Billing feedback may update commercial visibility and customer lifecycle signals.
- Feedback does not rewrite historical quote, opportunity, or interaction records in place.

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- CRM candidate treated as SFA lead without SFA intake
- SFA quote request treated as sales quote without Sales intake
- quote treated as sales order without 04.order-management intake
- CRM/SFA/Sales signal treated as demand forecast truth
- demand forecast rewriting opportunity amount
- invoice rewriting quote price condition
- billing feedback directly changing opportunity won/lost without SFA workflow
- order feedback directly changing CRM interaction history in place
- BI dashboard changing CRM/SFA/Sales/Demand/Order/Billing truth

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- commercial detailed handoff reinforcement fixed
- CRM/SFA/Sales to demand forecasting signal boundaries fixed
- quote-to-order feedback boundaries fixed
- billing feedback boundaries fixed
- BI projection boundary preserved

# ============================================================


# ------------------------------------------------------------
## SOURCE: 03.crm/920.meta/9203000002_CRM_TO_SFA_FORECAST_BILLING_FEEDBACK_HANDOFF_EXACT.md
# ------------------------------------------------------------

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


# ------------------------------------------------------------
## SOURCE: 02.sfa/920.meta/9202000002_SFA_TO_SALES_DEMAND_ORDER_FEEDBACK_HANDOFF_EXACT.md
# ------------------------------------------------------------

# ============================================================
# SFA TO SALES / DEMAND / ORDER FEEDBACK HANDOFF EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 02.sfa
track: Track C
related_modules:
- 01.sales
- 04.order-management
- 06.demand-forecasting
- 03.crm
- 60.business-intelligence

purpose:
Define detailed SFA handoffs to Sales and Demand Forecasting, and define how
order/sales feedback updates opportunity and pipeline state without SFA owning
quote/order truth.

canonical_role:
- lead / opportunity / activity / pipeline truth

# ============================================================
# 1. SFA TO SALES QUOTE REQUEST BASIS
# ============================================================

handoff_object_name:
- sfa_to_sales_quote_request_basis

required_fields:
- quote_request_basis_id
- company_id
- source_module
- target_module
- opportunity_id
- lead_id_or_null
- master_customer_or_partner_reference_or_null
- crm_account_profile_id_or_null
- requested_product_or_service_scope
- requested_quantity_or_null
- quantity_uom_or_null
- requested_price_or_budget_signal_or_null
- requested_delivery_date_or_null
- commercial_context_summary
- opportunity_stage_at_request
- probability_percent_at_request
- expected_close_date_or_null
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

rules:
- source_module must be 02.sfa
- target_module must be 01.sales
- quote request basis is not quote
- 01.sales owns quote after acceptance
- SFA owns opportunity and opportunity stage

# ============================================================
# 2. SFA TO DEMAND FORECASTING PIPELINE SIGNAL
# ============================================================

handoff_object_name:
- sfa_to_demand_forecasting_pipeline_signal

required_fields:
- sfa_demand_signal_id
- company_id
- source_module
- target_module
- pipeline_forecast_signal_id_or_null
- opportunity_reference_set_or_group
- period_start
- period_end
- product_or_category_reference_or_null
- region_or_channel_reference_or_null
- weighted_amount
- unweighted_amount
- expected_quantity_or_null
- quantity_uom_or_null
- probability_basis
- signal_confidence_or_null
- signal_status
- created_at
- lineage_reference

allowed_signal_status:
- building
- handoff_ready
- sent_to_demand_forecasting
- accepted_by_demand_forecasting
- rejected_by_demand_forecasting
- consumed_in_forecast_run
- cancelled
- superseded

rules:
- source_module must be 02.sfa
- target_module must be 06.demand-forecasting
- pipeline signal is forecast input only
- 06 owns demand forecast
- demand forecast does not rewrite opportunity amount/probability

# ============================================================
# 3. SALES FEEDBACK TO SFA
# ============================================================

accepted_feedback_object:
- sales_to_sfa_quote_feedback

required_fields:
- sales_sfa_quote_feedback_id
- company_id
- source_module
- target_module
- opportunity_id
- quote_request_basis_id_or_null
- sales_quote_id
- quote_status
- quote_amount_or_null
- currency_code_or_null
- quote_revision_number_or_null
- feedback_type
- feedback_summary
- feedback_at
- lineage_reference

feedback_type_examples:
- quote_created
- quote_issued
- quote_revised
- quote_accepted_by_customer
- quote_rejected_by_customer
- quote_expired
- quote_cancelled
- quote_converted_to_order

rules:
- source_module must be 01.sales
- target_module must be 02.sfa
- SFA may update opportunity stage through SFA workflow
- SFA does not rewrite quote truth

# ============================================================
# 4. ORDER FEEDBACK TO SFA
# ============================================================

accepted_feedback_object:
- order_to_sfa_win_loss_feedback

required_fields:
- order_sfa_feedback_id
- company_id
- source_module
- target_module
- opportunity_id_or_null
- sales_quote_id_or_null
- sales_order_id
- customer_id
- order_status
- ordered_amount_or_null
- currency_code_or_null
- win_loss_signal
- feedback_summary
- feedback_at
- lineage_reference

win_loss_signal_examples:
- won
- partially_won
- lost_after_quote
- order_cancelled
- order_on_hold
- expansion_order
- renewal_order

rules:
- source_module must be 04.order-management
- target_module must be 02.sfa
- order feedback may close opportunity as won/lost through SFA workflow
- SFA does not own order truth
- cancellation feedback may reopen opportunity only by SFA workflow

# ============================================================
# 5. SFA OPPORTUNITY UPDATE RULES
# ============================================================

opportunity_update_rules:
- quote_created may move stage to quote_requested or proposal_preparation
- quote_issued may move stage to quote_issued or negotiation
- quote_accepted_by_customer may move stage to verbal_commit or closed_won candidate
- order_created may move stage to closed_won
- quote_rejected or order_cancelled may move stage to closed_lost or reactivation workflow
- every stage update must write stage history
- source feedback lineage must be retained

# ============================================================
# 6. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- quote request basis treated as quote
- sales quote feedback changing opportunity without SFA stage history
- order feedback changing quote truth
- demand forecast changing opportunity probability
- opportunity won creating invoice directly
- BI dashboard changing pipeline stage

# ============================================================
# 7. COMPLETION STATE
# ============================================================

completion_state:
- SFA to Sales quote request handoff fixed
- SFA to Demand Forecasting signal fixed
- Sales/Order feedback to SFA fixed
- opportunity update rules fixed

# ============================================================


# ------------------------------------------------------------
## SOURCE: 01.sales/920.meta/9201000003_SALES_TO_DEMAND_ORDER_BILLING_FEEDBACK_HANDOFF_EXACT.md
# ------------------------------------------------------------

# ============================================================
# SALES TO DEMAND / ORDER / BILLING FEEDBACK HANDOFF EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 01.sales
track: Track C
related_modules:
- 02.sfa
- 04.order-management
- 05.billing
- 06.demand-forecasting
- 60.business-intelligence

purpose:
Define detailed Sales handoffs to demand forecasting and order management,
plus feedback from billing/order to Sales without Sales owning order or invoice
truth.

canonical_role:
- quote / price / discount / promotion / commercial pre-order truth

# ============================================================
# 1. SALES TO DEMAND FORECASTING PROMOTION SIGNAL
# ============================================================

handoff_object_name:
- sales_to_demand_forecasting_promotion_signal

required_fields:
- promotion_forecast_signal_id
- company_id
- source_module
- target_module
- promotion_id
- promotion_condition_reference_set
- target_item_or_category_reference_set
- target_customer_or_segment_reference_set_or_null
- target_channel_reference_set_or_null
- target_region_reference_set_or_null
- promotion_start_at
- promotion_end_at
- expected_lift_or_effect_reference_or_null
- promotion_budget_or_null
- signal_status
- created_at
- lineage_reference

allowed_signal_status:
- building
- handoff_ready
- sent_to_demand_forecasting
- accepted_by_demand_forecasting
- rejected_by_demand_forecasting
- consumed_in_forecast_run
- cancelled
- superseded

rules:
- source_module must be 01.sales
- target_module must be 06.demand-forecasting
- promotion signal is forecast input only
- demand forecast does not own promotion definition
- forecast rejection does not cancel promotion

# ============================================================
# 2. SALES TO ORDER AUTHORIZED ORDER BASIS
# ============================================================

handoff_object_name:
- sales_to_order_authorized_order_basis

required_fields:
- authorized_order_basis_id
- company_id
- source_module
- target_module
- sales_quote_id
- quote_revision_number
- customer_or_partner_reference
- customer_acceptance_evidence_reference
- commercial_terms_reference
- price_condition_reference_set
- discount_condition_reference_set_or_null
- promotion_reference_set_or_null
- quote_line_basis_set
- package_status
- created_at
- lineage_reference

quote_line_basis_required_fields:
- quote_line_basis_id
- sales_quote_line_id
- item_id_or_service_id
- accepted_quantity
- quantity_uom
- accepted_unit_price_or_condition_reference
- requested_delivery_date_or_null
- fulfillment_note_or_null

allowed_package_status:
- building
- validation_pending
- handoff_ready
- sent_to_order_management
- accepted_by_order_management
- rejected_by_order_management
- order_created
- cancelled
- superseded

rules:
- source_module must be 01.sales
- target_module must be 04.order-management
- authorized order basis is not sales order
- 04 owns accepted order
- quote conversion status is updated from 04 feedback

# ============================================================
# 3. SALES TO SFA QUOTE FEEDBACK
# ============================================================

handoff_object_name:
- sales_to_sfa_quote_feedback

required_fields:
- sales_sfa_quote_feedback_id
- company_id
- source_module
- target_module
- opportunity_id_or_null
- quote_request_basis_id_or_null
- sales_quote_id
- quote_status
- quote_amount_or_null
- currency_code_or_null
- quote_revision_number_or_null
- feedback_type
- feedback_summary
- feedback_at
- lineage_reference

rules:
- target_module must be 02.sfa
- SFA may update opportunity by SFA workflow
- Sales does not own opportunity stage

# ============================================================
# 4. ORDER FEEDBACK TO SALES
# ============================================================

accepted_feedback_object:
- order_to_sales_conversion_feedback

required_fields:
- order_sales_feedback_id
- company_id
- source_module
- target_module
- sales_quote_id
- authorized_order_basis_id_or_null
- sales_order_id
- order_status
- order_created_at_or_null
- order_rejection_reason_or_null
- feedback_type
- feedback_at
- lineage_reference

feedback_type_examples:
- order_intake_accepted
- order_created
- order_intake_rejected
- order_cancelled
- order_partially_converted
- order_superseded

rules:
- source_module must be 04.order-management
- target_module must be 01.sales
- Sales may update quote conversion status
- Sales may not rewrite order truth
- rejected order intake may require quote/order-basis correction

# ============================================================
# 5. BILLING FEEDBACK TO SALES
# ============================================================

accepted_feedback_object:
- billing_to_sales_invoice_feedback

required_fields:
- billing_sales_feedback_id
- company_id
- source_module
- target_module
- sales_quote_id_or_null
- sales_order_id_or_null
- customer_invoice_id
- invoice_status
- invoice_amount
- currency_code
- billing_feedback_type
- feedback_at
- lineage_reference

billing_feedback_type_examples:
- invoice_issued
- invoice_cancelled
- invoice_adjusted
- credit_memo_issued
- billing_dispute_opened
- invoice_paid_signal

rules:
- source_module must be 05.billing
- target_module must be 01.sales
- Sales may use feedback for commercial analysis
- Sales does not rewrite invoice
- Billing does not rewrite quote price condition

# ============================================================
# 6. QUOTE STATUS UPDATE RULES
# ============================================================

quote_status_update_rules:
- accepted_by_order_management may move quote to converted_to_order or partially_converted
- rejected_by_order_management may keep quote accepted_by_customer with correction_required status
- order_cancelled does not erase quote history
- invoice_issued does not change quote price condition
- billing adjustment does not rewrite quote unless Sales creates explicit quote correction for future use

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- promotion signal treated as demand forecast
- authorized order basis treated as accepted order
- billing invoice changing quote price directly
- order rejection deleting quote
- invoice paid signal changing opportunity stage directly from Sales
- BI dashboard converting quote to order

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- Sales to Demand Forecasting signal fixed
- Sales to Order handoff fixed
- Sales to SFA feedback fixed
- Order/Billing feedback to Sales fixed

# ============================================================


# ------------------------------------------------------------
## SOURCE: 06.demand-forecasting/920.meta/9206000002_COMMERCIAL_SIGNAL_INTAKE_EXACT_DESIGN.md
# ------------------------------------------------------------

# ============================================================
# COMMERCIAL SIGNAL INTAKE EXACT DESIGN
# CRM / SFA / SALES TO DEMAND FORECASTING
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 06.demand-forecasting
track: Track C
related_modules:
- 03.crm
- 02.sfa
- 01.sales
- 07.sop-consensus
- 60.business-intelligence

purpose:
Define exact intake of commercial signals from CRM, SFA, and Sales into Demand
Forecasting without transferring CRM/SFA/Sales source truth to forecasting.

canonical_role:
- market-side demand forecast truth

# ============================================================
# 1. ACCEPTED COMMERCIAL SIGNALS
# ============================================================

accepted_input_objects:
- crm_to_demand_forecasting_customer_signal
- sfa_to_demand_forecasting_pipeline_signal
- sales_to_demand_forecasting_promotion_signal
- order_history_signal_snapshot
- billing_history_signal_snapshot

rules:
- signals are input evidence only
- forecast result belongs to 06
- source truth remains in source modules
- every signal must preserve source lineage

# ============================================================
# 2. COMMERCIAL SIGNAL INTAKE
# ============================================================

object_name:
- demand_commercial_signal_intake

required_fields:
- commercial_signal_intake_id
- company_id
- source_module
- source_signal_object_type
- source_signal_object_id
- signal_type
- signal_period_start_or_null
- signal_period_end_or_null
- item_or_category_reference_or_null
- customer_or_segment_reference_or_null
- channel_reference_or_null
- region_reference_or_null
- signal_quantity_or_amount_or_score_or_null
- signal_confidence_or_null
- source_lineage_reference
- intake_status
- received_at
- lineage_reference

signal_type_examples:
- crm_customer_interest
- crm_churn_risk
- crm_campaign_response
- sfa_pipeline_weighted_amount
- sfa_opportunity_expected_quantity
- sales_promotion_lift
- sales_price_change_signal
- quote_activity_signal
- order_history_signal
- billing_history_signal

allowed_intake_status:
- received
- validation_pending
- accepted
- rejected
- normalized
- consumed_in_forecast_run
- cancelled
- superseded

acceptance_requires:
- source_module in 03.crm / 02.sfa / 01.sales / 04.order-management / 05.billing
- source object resolvable
- signal type supported
- period / item / category / channel / region resolvable where required
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- SOURCE_MODULE_UNSUPPORTED
- SOURCE_OBJECT_UNRESOLVABLE
- SIGNAL_TYPE_UNSUPPORTED
- PERIOD_INVALID
- ITEM_CATEGORY_UNRESOLVABLE
- CHANNEL_REGION_UNRESOLVABLE
- QUANTITY_AMOUNT_INVALID
- LINEAGE_MISSING
- DUPLICATE_OR_SUPERSEDED_SIGNAL

# ============================================================
# 3. SIGNAL NORMALIZATION
# ============================================================

object_name:
- demand_commercial_signal_normalization

required_fields:
- signal_normalization_id
- company_id
- commercial_signal_intake_id
- normalization_method
- normalized_signal_type
- normalized_quantity_or_amount_or_score
- normalization_confidence
- normalization_note_or_null
- normalized_at
- lineage_reference

normalization_method_examples:
- direct_quantity
- weighted_pipeline
- promotion_lift_factor
- segment_interest_score
- historical_conversion_rate
- manual_planner_mapping
- rule_based_mapping

rules:
- normalization belongs to 06
- normalization does not rewrite source signal
- rejected normalization must preserve reason

# ============================================================
# 4. FORECAST RUN CONSUMPTION
# ============================================================

object_name:
- demand_forecast_commercial_signal_consumption

required_fields:
- signal_consumption_id
- company_id
- forecast_run_id
- commercial_signal_intake_id
- signal_normalization_id_or_null
- consumption_weight
- consumption_role
- consumed_at
- lineage_reference

consumption_role_examples:
- baseline_adjustment
- promotion_lift
- pipeline_input
- churn_adjustment
- segment_shift
- planner_reference
- excluded_reference

rules:
- forecast run may consume or exclude signal
- exclusion must preserve reason
- source module cannot force forecast result
- forecast result does not rewrite source signal

# ============================================================
# 5. FORECAST FEEDBACK TO SOURCE
# ============================================================

handoff_object_name:
- demand_forecasting_to_commercial_signal_feedback

required_fields:
- commercial_signal_feedback_id
- company_id
- source_module
- target_module
- forecast_run_id
- commercial_signal_intake_id
- source_signal_object_type
- source_signal_object_id
- signal_consumption_status
- forecast_impact_summary_or_null
- rejection_reason_code_or_null
- feedback_at
- lineage_reference

signal_consumption_status_examples:
- accepted
- normalized
- consumed
- excluded
- rejected
- superseded

rules:
- feedback is insight/status only
- target source module may display or analyze feedback
- source module is not automatically corrected by forecast feedback

# ============================================================
# 6. HANDOFF TO S&OP
# ============================================================

sop_handoff_rule:
- commercial signals may influence demand forecast.
- demand forecast candidate to S&OP remains governed by existing 06 -> 07 handoff.
- S&OP consensus truth belongs to 07.
- commercial signal never bypasses 06 and 07 to become production plan.

# ============================================================
# 7. OUTPUT TO BI
# ============================================================

BI_consumable_outputs:
- commercial signal intake snapshot
- signal normalization snapshot
- signal consumption snapshot
- forecast impact snapshot
- rejection reason snapshot

rules:
- BI visualizes signal usage
- BI does not normalize or consume signals
- BI does not change forecast result

# ============================================================
# 8. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- SFA pipeline amount treated as demand forecast truth
- sales promotion signal treated as S&OP consensus
- CRM interest signal treated as production plan
- demand forecast overwriting opportunity amount
- forecast feedback changing promotion definition
- BI dashboard changing signal weight

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- commercial signal intake exact design fixed
- signal normalization fixed
- forecast run consumption fixed
- feedback to source modules fixed
- S&OP boundary preserved

# ============================================================


# ------------------------------------------------------------
## SOURCE: 04.order-management/920.meta/9204000002_COMMERCIAL_ORDER_INTAKE_AND_FEEDBACK_EXACT.md
# ------------------------------------------------------------

# ============================================================
# COMMERCIAL ORDER INTAKE AND FEEDBACK EXACT
# SALES / SFA / CRM TO ORDER MANAGEMENT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 04.order-management
track: Track C
related_modules:
- 01.sales
- 02.sfa
- 03.crm
- 05.billing
- 60.business-intelligence

purpose:
Define detailed order intake from Sales authorized order basis and define
feedback to Sales/SFA/CRM/Billing without order management owning quote,
opportunity, CRM relationship, or invoice truth.

canonical_role:
- accepted customer order / fulfillment orchestration truth

# ============================================================
# 1. SALES AUTHORIZED ORDER BASIS INTAKE
# ============================================================

accepted_input_object:
- sales_to_order_authorized_order_basis

required_fields:
- order_intake_id
- company_id
- source_module
- target_module
- authorized_order_basis_id
- sales_quote_id
- quote_revision_number
- customer_or_partner_reference
- customer_acceptance_evidence_reference
- commercial_terms_reference
- price_condition_reference_set
- discount_condition_reference_set_or_null
- promotion_reference_set_or_null
- quote_line_basis_set
- intake_status
- received_at
- lineage_reference

allowed_intake_status:
- received
- validation_pending
- accepted
- rejected
- sales_order_created
- cancelled
- superseded

acceptance_requires:
- source_module = 01.sales
- target_module = 04.order-management
- quote reference resolvable
- customer reference resolvable or policy allows
- customer acceptance evidence present
- line basis valid
- commercial terms resolvable
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- QUOTE_UNRESOLVABLE
- CUSTOMER_UNRESOLVABLE
- CUSTOMER_ACCEPTANCE_MISSING
- LINE_BASIS_INVALID
- COMMERCIAL_TERMS_INVALID
- PACKAGE_NOT_READY
- LINEAGE_MISSING
- DUPLICATE_OR_SUPERSEDED_BASIS

rules:
- accepted intake may create sales_order
- authorized order basis is not sales_order
- Sales keeps quote truth
- Order Management owns accepted order after creation

# ============================================================
# 2. ORDER TO SALES CONVERSION FEEDBACK
# ============================================================

handoff_object_name:
- order_to_sales_conversion_feedback

required_fields:
- order_sales_feedback_id
- company_id
- source_module
- target_module
- sales_quote_id
- authorized_order_basis_id_or_null
- sales_order_id_or_null
- order_status_or_rejection_status
- order_created_at_or_null
- rejection_reason_code_or_null
- rejection_detail_or_null
- feedback_type
- feedback_at
- lineage_reference

feedback_type_examples:
- order_intake_accepted
- order_created
- order_intake_rejected
- order_cancelled
- order_partially_converted
- order_superseded

rules:
- source_module must be 04.order-management
- target_module must be 01.sales
- Sales may update quote conversion status
- feedback does not rewrite quote lines in place

# ============================================================
# 3. ORDER TO SFA WIN/LOSS FEEDBACK
# ============================================================

handoff_object_name:
- order_to_sfa_win_loss_feedback

required_fields:
- order_sfa_feedback_id
- company_id
- source_module
- target_module
- opportunity_id_or_null
- sales_quote_id_or_null
- sales_order_id
- customer_id
- order_status
- ordered_amount_or_null
- currency_code_or_null
- win_loss_signal
- feedback_summary
- feedback_at
- lineage_reference

win_loss_signal_examples:
- won
- partially_won
- lost_after_quote
- order_cancelled
- order_on_hold
- expansion_order
- renewal_order

rules:
- target_module must be 02.sfa
- SFA may update opportunity stage through SFA workflow
- Order Management does not own opportunity truth

# ============================================================
# 4. ORDER TO CRM RELATIONSHIP FEEDBACK
# ============================================================

handoff_object_name:
- order_to_crm_customer_lifecycle_feedback

required_fields:
- order_crm_feedback_id
- company_id
- source_module
- target_module
- crm_account_profile_id_or_null
- customer_id
- sales_order_id
- order_status
- order_amount_or_null
- currency_code_or_null
- lifecycle_signal_type
- feedback_summary
- feedback_at
- lineage_reference

lifecycle_signal_type_examples:
- first_order
- repeat_order
- high_value_order
- cancelled_order
- delayed_order
- partial_fulfillment
- churn_risk_signal
- retention_signal

rules:
- target_module must be 03.crm
- CRM may update relationship context through CRM workflow
- Order Management does not own CRM account profile

# ============================================================
# 5. ORDER TO BILLING REQUEST BOUNDARY
# ============================================================

existing_handoff:
- order_to_billing_invoice_request

reinforcement_rules:
- order_to_billing_invoice_request is billing candidate/request only
- 05.billing owns invoice creation
- delivery/fulfillment references must remain traceable
- quote price condition remains Sales truth
- invoice amount belongs to Billing after billing workflow

# ============================================================
# 6. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- authorized order basis treated as sales order
- sales order creation rewriting quote history in place
- order feedback directly changing SFA stage without SFA workflow
- order feedback directly changing CRM relationship without CRM workflow
- order request treated as invoice
- BI dashboard accepting order intake

# ============================================================
# 7. COMPLETION STATE
# ============================================================

completion_state:
- commercial order intake fixed
- order feedback to Sales/SFA/CRM fixed
- billing request boundary reinforced

# ============================================================


# ------------------------------------------------------------
## SOURCE: 05.billing/920.meta/9205000003_BILLING_COMMERCIAL_FEEDBACK_EXACT.md
# ------------------------------------------------------------

# ============================================================
# BILLING COMMERCIAL FEEDBACK EXACT
# SALES / CRM / ORDER FEEDBACK BOUNDARY
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 05.billing
track: Track C
related_modules:
- 01.sales
- 03.crm
- 04.order-management
- 60.business-intelligence

purpose:
Define billing feedback to Sales, CRM, and Order Management without billing
rewriting quote, customer relationship, or order truth.

canonical_role:
- invoice / billing / customer charge truth

# ============================================================
# 1. BILLING TO SALES INVOICE FEEDBACK
# ============================================================

handoff_object_name:
- billing_to_sales_invoice_feedback

required_fields:
- billing_sales_feedback_id
- company_id
- source_module
- target_module
- sales_quote_id_or_null
- sales_order_id_or_null
- customer_invoice_id
- invoice_status
- invoice_amount
- currency_code
- billing_feedback_type
- adjustment_reference_or_null
- payment_signal_reference_or_null
- feedback_at
- lineage_reference

billing_feedback_type_examples:
- invoice_issued
- invoice_cancelled
- invoice_adjusted
- credit_memo_issued
- billing_dispute_opened
- invoice_paid_signal
- invoice_overdue_signal

rules:
- source_module must be 05.billing
- target_module must be 01.sales
- Sales may use feedback for commercial analysis
- Sales may not rewrite invoice
- Billing may not rewrite quote price condition

# ============================================================
# 2. BILLING TO CRM CUSTOMER BILLING SIGNAL
# ============================================================

handoff_object_name:
- billing_to_crm_customer_billing_signal

required_fields:
- billing_crm_signal_id
- company_id
- source_module
- target_module
- customer_id_or_master_reference
- crm_account_profile_id_or_null
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
- payment_behavior_signal

allowed_feedback_status:
- building
- sent_to_crm
- accepted_by_crm
- rejected_by_crm
- converted_to_crm_case
- cancelled
- superseded

rules:
- target_module must be 03.crm
- CRM may create case/interaction/relationship context
- CRM does not own invoice truth
- Billing does not own CRM relationship truth

# ============================================================
# 3. BILLING TO ORDER FEEDBACK
# ============================================================

handoff_object_name:
- billing_to_order_billing_status_feedback

required_fields:
- billing_order_feedback_id
- company_id
- source_module
- target_module
- sales_order_id
- customer_invoice_id
- invoice_status
- billed_amount
- currency_code
- billing_status_signal
- feedback_at
- lineage_reference

billing_status_signal_examples:
- billing_requested_accepted
- invoice_created
- invoice_issued
- invoice_cancelled
- invoice_adjusted
- billing_rejected_order_request
- billing_completed

rules:
- target_module must be 04.order-management
- order may update billing status projection
- order does not own invoice truth
- billing does not own order fulfillment truth

# ============================================================
# 4. FEEDBACK RESPONSE RULES
# ============================================================

feedback_response_rules:
- Sales can update quote analytics / commercial analysis status.
- CRM can update relationship context, case, or interaction.
- Order Management can update order billing status projection.
- None of these feedback targets may rewrite invoice truth directly.
- Billing correction must occur in 05.billing.

# ============================================================
# 5. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- invoice feedback changing quote price condition
- invoice paid signal changing CRM relationship status without CRM workflow
- billing feedback changing order fulfillment state
- sales analysis feedback changing invoice status
- BI dashboard marking invoice issued/paid

# ============================================================
# 6. COMPLETION STATE
# ============================================================

completion_state:
- billing commercial feedback fixed
- feedback to Sales/CRM/Order boundaries fixed
- invoice truth preserved in Billing

# ============================================================


# ------------------------------------------------------------
## SOURCE: 00.foundation/920.meta/9200000329_TRACK_C_COMMERCIAL_SIDE_DEEPENING_INDEX.md
# ------------------------------------------------------------

# ============================================================
# ERP TRACK C COMMERCIAL-SIDE DEEPENING INDEX
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track C
track_name: CRM / SFA / Sales commercial-side deepening
scope:
- 03.crm
- 02.sfa
- 01.sales
- 04.order-management
- 05.billing
- 06.demand-forecasting
- 52.master-data
- 60.business-intelligence

purpose:
Index the commercial-side exact design and detailed handoff documents added
during Track C so ERP design can continue without losing current state.

# ============================================================
# 1. TRACK C POSITION
# ============================================================

track_c_position:
- Track C started after Track B finance-side completion.
- Track C focuses on the customer-facing commercial core:
  - customer relationship
  - CRM account/contact/interaction
  - lead/opportunity/pipeline
  - quote/price/discount/promotion
  - commercial signals to demand forecasting
  - quote-to-order intake and feedback
  - billing commercial feedback
  - customer master boundary

current_state:
- Track C commercial-side exact design bundle created.
- Track C detailed commercial handoff reinforcement created.
- This index records coverage and remaining gaps.

# ============================================================
# 2. TRACK C CREATED DOCUMENTS
# ============================================================

## 2.1 Commercial-side boundary memo

docs:
- 00.foundation/920.meta/9200000327_COMMERCIAL_CRM_SFA_SALES_BOUNDARY_MEMO.md

fixed:
- customer master / CRM / SFA / Sales / Order / Billing / Demand / BI boundary
- commercial source ownership
- forecast signal rule
- CRM/SFA/Sales ownership separation
- forbidden shortcuts

## 2.2 CRM exact design

docs:
- 03.crm/920.meta/9203000001_CRM_CUSTOMER_ACCOUNT_CONTACT_INTERACTION_EXACT_DESIGN.md
- 03.crm/920.meta/9203000002_CRM_TO_SFA_FORECAST_BILLING_FEEDBACK_HANDOFF_EXACT.md

fixed:
- CRM customer master reference intake
- CRM account profile
- CRM contact profile
- account-contact relationship
- relationship status
- customer segment assignment
- customer preference
- CRM interaction
- CRM case / inquiry
- CRM-to-SFA lead candidate
- CRM-to-demand-forecasting customer signal
- billing-to-CRM customer billing signal intake

## 2.3 SFA exact design

docs:
- 02.sfa/920.meta/9202000001_SFA_LEAD_OPPORTUNITY_ACTIVITY_PIPELINE_EXACT_DESIGN.md
- 02.sfa/920.meta/9202000002_SFA_TO_SALES_DEMAND_ORDER_FEEDBACK_HANDOFF_EXACT.md

fixed:
- SFA lead
- lead qualification
- opportunity
- opportunity stage history
- sales activity
- pipeline forecast signal
- SFA-to-sales quote request basis
- SFA-to-demand-forecasting pipeline signal
- sales quote feedback to SFA
- order win/loss feedback to SFA

## 2.4 Sales exact design

docs:
- 01.sales/920.meta/9201000001_SALES_TO_ORDER_MANAGEMENT_BOUNDARY_EXACT.md
- 01.sales/920.meta/9201000002_SALES_PRICE_DISCOUNT_PROMOTION_QUOTE_EXACT_DESIGN.md
- 01.sales/920.meta/9201000003_SALES_TO_DEMAND_ORDER_BILLING_FEEDBACK_HANDOFF_EXACT.md

fixed:
- sales quote request intake
- sales price condition
- sales discount condition
- sales promotion
- sales promotion condition
- sales quote
- sales quote line
- quote revision
- quote approval package
- sales-to-order authorized order basis
- sales-to-demand-forecasting promotion signal
- sales-to-SFA quote feedback
- order/billing feedback to Sales

## 2.5 Commercial signal intake to Demand Forecasting

docs:
- 06.demand-forecasting/920.meta/9206000002_COMMERCIAL_SIGNAL_INTAKE_EXACT_DESIGN.md

fixed:
- CRM/SFA/Sales commercial signal intake
- signal validation / rejection
- signal normalization
- forecast run consumption
- forecast feedback to commercial source modules
- S&OP boundary preservation

## 2.6 Commercial order intake and feedback

docs:
- 04.order-management/920.meta/9204000002_COMMERCIAL_ORDER_INTAKE_AND_FEEDBACK_EXACT.md

fixed:
- sales authorized order basis intake
- order-to-sales conversion feedback
- order-to-SFA win/loss feedback
- order-to-CRM lifecycle feedback
- order-to-billing request boundary reinforcement

## 2.7 Billing commercial feedback

docs:
- 05.billing/920.meta/9205000003_BILLING_COMMERCIAL_FEEDBACK_EXACT.md

fixed:
- billing-to-sales invoice feedback
- billing-to-CRM customer billing signal
- billing-to-order billing status feedback
- invoice truth preservation

## 2.8 Detailed commercial handoff reinforcement

docs:
- 00.foundation/920.meta/9200000328_COMMERCIAL_DETAILED_HANDOFF_REINFORCEMENT_MEMO.md

fixed:
- CRM/SFA/Sales signal/basis/feedback separation
- CRM/SFA/Sales to demand forecasting signal boundary
- quote-to-order feedback boundary
- billing feedback boundary
- BI projection boundary

# ============================================================
# 3. TRACK C FIXED OWNERSHIP SUMMARY
# ============================================================

ownership_summary:
- 52.master-data owns shared customer / business partner identity.
- 03.crm owns customer relationship, account, contact, interaction, case, preference, and relationship-side segment truth.
- 02.sfa owns lead, qualification, opportunity, opportunity stage, sales activity, and pipeline truth.
- 01.sales owns quote, price condition, discount condition, promotion, commercial terms, and pre-order commercial truth.
- 04.order-management owns accepted order and fulfillment orchestration truth.
- 05.billing owns invoice, billing, billing adjustment, and customer charge truth.
- 06.demand-forecasting owns demand forecast truth.
- 60.business-intelligence owns analytical projection only.

# ============================================================
# 4. TRACK C HANDOFF SUMMARY
# ============================================================

handoff_summary:
- 52.master-data -> 03.crm:
  - master_to_crm_customer_reference_publication
- 03.crm -> 02.sfa:
  - crm_to_sfa_lead_candidate
- 03.crm -> 06.demand-forecasting:
  - crm_to_demand_forecasting_customer_signal
- 02.sfa -> 01.sales:
  - sfa_to_sales_quote_request_basis
- 02.sfa -> 06.demand-forecasting:
  - sfa_to_demand_forecasting_pipeline_signal
- 01.sales -> 06.demand-forecasting:
  - sales_to_demand_forecasting_promotion_signal
- 01.sales -> 04.order-management:
  - sales_to_order_authorized_order_basis
- 01.sales -> 02.sfa:
  - sales_to_sfa_quote_feedback
- 04.order-management -> 01.sales:
  - order_to_sales_conversion_feedback
- 04.order-management -> 02.sfa:
  - order_to_sfa_win_loss_feedback
- 04.order-management -> 03.crm:
  - order_to_crm_customer_lifecycle_feedback
- 04.order-management -> 05.billing:
  - order_to_billing_invoice_request
- 05.billing -> 01.sales:
  - billing_to_sales_invoice_feedback
- 05.billing -> 03.crm:
  - billing_to_crm_customer_billing_signal
- 05.billing -> 04.order-management:
  - billing_to_order_billing_status_feedback
- commercial source modules -> 60.business-intelligence:
  - source snapshots / analytical projections only

# ============================================================
# 5. TRACK C GLOBAL FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- CRM account profile creating shared customer identity without 52 workflow
- CRM candidate treated as SFA lead without SFA intake
- CRM interaction directly becoming opportunity
- SFA lead treated as customer master
- SFA opportunity treated as sales quote
- SFA quote request treated as quote
- quote treated as accepted order without 04.order-management intake
- promotion signal treated as demand forecast truth
- SFA pipeline probability treated as S&OP consensus truth
- demand forecast rewriting opportunity amount or promotion definition
- invoice rewriting quote price condition
- billing feedback directly changing opportunity stage without SFA workflow
- order feedback directly changing CRM relationship without CRM workflow
- BI dashboard changing CRM / SFA / Sales / Demand / Order / Billing truth

# ============================================================
# 6. TRACK C COMPLETION STATE
# ============================================================

completion_state:
- Track C commercial-side exact design indexed.
- CRM / SFA / Sales ownership fixed.
- Customer master boundary preserved.
- Commercial signal intake to demand forecasting fixed.
- Quote-to-order and order feedback boundaries fixed.
- Billing commercial feedback boundary fixed.
- BI projection boundary preserved.
- Track C can be treated as complete for boundary/exact-design layer.

# ============================================================


# ------------------------------------------------------------
## SOURCE: 00.foundation/920.meta/9200000330_TRACK_C_COMMERCIAL_SIDE_COVERAGE_LEDGER.md
# ------------------------------------------------------------

# ============================================================
# ERP TRACK C COMMERCIAL-SIDE COVERAGE LEDGER
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track C
scope:
- commercial-side module coverage
- fixed exact objects
- remaining gaps

purpose:
Record commercial-side coverage and remaining gaps after Track C exact design
and detailed handoff reinforcement.

# ============================================================
# 1. COVERAGE OVERVIEW
# ============================================================

coverage_status:
- customer_master_boundary: covered
- CRM_account_contact_interaction: covered
- CRM_to_SFA_candidate: covered
- SFA_lead_opportunity_pipeline: covered
- SFA_to_sales_quote_request: covered
- Sales_price_discount_promotion_quote: covered
- Sales_to_order_basis: covered
- Commercial_signal_to_demand_forecasting: covered
- Order_feedback_to_sales_sfa_crm: covered
- Billing_feedback_to_sales_crm_order: covered
- BI_projection_boundary: covered

not_final_implementation_status:
- This ledger is design coverage only.
- It does not mean implementation is complete.
- It does not mean DB schema has been applied.
- It does not mean API payloads are frozen.
- It does not mean integrated markdown has been regenerated.

# ============================================================
# 2. MODULE COVERAGE
# ============================================================

## 2.1 03.crm

coverage:
- customer master reference intake
- CRM account profile
- contact profile
- account-contact relationship
- relationship status
- customer segment assignment
- customer preference
- CRM interaction
- CRM case / inquiry
- CRM-to-SFA lead candidate
- CRM-to-demand-forecasting signal
- billing-to-CRM feedback intake

coverage_level:
- exact-design-ready

remaining_gaps:
- campaign management full lifecycle if CRM-owned
- customer support/service deepening if separated later
- consent/privacy preference catalog
- loyalty/member profile if included later
- CRM case escalation and SLA
- customer communication template catalog

## 2.2 02.sfa

coverage:
- lead
- lead qualification
- opportunity
- opportunity stage history
- sales activity
- pipeline forecast signal
- SFA-to-sales quote request basis
- SFA-to-demand-forecasting signal
- sales quote feedback to SFA
- order win/loss feedback to SFA

coverage_level:
- exact-design-ready

remaining_gaps:
- sales target / quota exact design
- territory assignment
- sales performance incentive link
- pipeline review workflow
- partner channel opportunity
- forecast commit workflow distinct from demand forecasting

## 2.3 01.sales

coverage:
- sales quote request intake
- sales price condition
- discount condition
- sales promotion
- promotion condition
- quote
- quote line
- quote revision
- quote approval package
- sales-to-order authorized order basis
- sales-to-demand promotion signal
- sales-to-SFA quote feedback
- order/billing feedback to Sales

coverage_level:
- exact-design-ready

remaining_gaps:
- sales contract / framework agreement
- price list catalog
- rebate / coupon settlement deepening
- quotation document format catalog
- margin simulation / approval policy
- promotion budget consumption and settlement

## 2.4 06.demand-forecasting

coverage_from_track_c:
- commercial signal intake
- signal validation
- signal normalization
- forecast run consumption
- signal feedback to source modules
- S&OP boundary preservation

coverage_level:
- boundary-ready / exact intake ready

remaining_gaps:
- model output vs planner override detail
- forecast accuracy measurement from actuals
- commercial signal weighting policy catalog
- promotion lift model catalog
- new product forecast policy catalog

## 2.5 04.order-management

coverage_from_track_c:
- commercial order intake from Sales
- order-to-sales conversion feedback
- order-to-SFA win/loss feedback
- order-to-CRM lifecycle feedback
- order-to-billing request boundary reinforcement

coverage_level:
- boundary-ready

remaining_gaps:
- order change / cancellation exact lifecycle
- return order lifecycle
- partial conversion from quote to order
- customer backorder and allocation exception
- subscription/service order variant if needed

## 2.6 05.billing

coverage_from_track_c:
- billing-to-sales invoice feedback
- billing-to-CRM customer billing signal
- billing-to-order billing status feedback
- invoice truth preservation

coverage_level:
- boundary-ready

remaining_gaps:
- billing dispute lifecycle
- customer refund workflow
- dunning / collection
- invoice format / tax invoice catalog
- subscription billing variant if needed

## 2.7 52.master-data

coverage_from_track_c:
- customer/business partner identity boundary
- master-to-CRM customer reference publication
- customer merge/split lineage rule by reference

coverage_level:
- boundary-ready

remaining_gaps:
- customer master exact catalog
- business partner master exact catalog
- contact/person reference exact catalog
- customer address/reference catalog
- consent/preference ownership mapping

## 2.8 60.business-intelligence

coverage_from_track_c:
- commercial dashboard projection boundary
- CRM/SFA/Sales/Demand/Order/Billing snapshot consumption

coverage_level:
- boundary-ready

remaining_gaps:
- commercial KPI catalog
- funnel dashboard exact design
- sales forecast vs demand forecast dashboard comparison
- customer lifecycle dashboard
- promotion ROI dashboard

# ============================================================
# 3. DESIGN READINESS ASSESSMENT
# ============================================================

readiness:
- boundary_layer: complete_for_track_c
- exact_object_layer: mostly_complete_for_track_c
- detailed_catalog_layer: partial
- implementation_layer: not_started_here
- DB_schema_apply_layer: not_started_here
- integrated_regeneration_layer: pending

meaning:
- Track C is ready to be consumed by later integrated docs.
- Track C is not yet implementation-ready unless schema/API/UI/runtime artifacts are separately created.
- Additional catalogs can be added later without changing ownership boundaries.

# ============================================================
# 4. TRACK C REMAINING GAPS
# ============================================================

high_value_remaining_gaps:
- customer / business partner master exact catalog
- price list / discount / promotion catalog
- campaign management if needed
- sales target / territory / quota
- CRM consent/privacy preference catalog
- billing dispute / collection / refund
- order return lifecycle
- commercial KPI catalog
- promotion ROI and forecast impact analysis

recommended_handling:
- Do not block moving to Track D.
- Treat these as Track C+ or future commercial detailed catalog additions.
- Preserve current ownership boundaries when adding them.

# ============================================================
# 5. TRACK C DONE CRITERIA
# ============================================================

done_criteria:
- core commercial module ownership fixed
- exact objects defined for key commercial flows
- handoff basis/signal/feedback objects defined
- rejection / correction / lineage expectations defined
- BI / master-data / demand-forecasting boundaries preserved
- remaining gaps documented

result:
- Track C design-deepening can be marked complete at the cross-module/exact-design level.

# ============================================================
# 6. COMPLETION STATE
# ============================================================

completion_state:
- Track C coverage ledger created
- remaining gaps documented
- readiness level declared
- Track D can start next

# ============================================================


# ------------------------------------------------------------
## SOURCE: 00.foundation/920.meta/9200000331_TRACK_C_COMPLETION_AND_NEXT_TRACK_D_START_NOTE.md
# ------------------------------------------------------------

# ============================================================
# ERP TRACK C COMPLETION AND NEXT TRACK D START NOTE
# ============================================================

status: active
owner: Boss
prepared_by: Zero
completed_track:
- Track C: CRM / SFA / Sales commercial-side deepening

next_recommended_track:
- Track D: Master Data specific catalogs

purpose:
Mark Track C as complete at the design-deepening layer and define the next
natural track.

# ============================================================
# 1. TRACK C COMPLETION DECLARATION
# ============================================================

track_c_completion:
- completed_at_design_deepening_layer
- commercial-side ownership boundaries fixed
- exact design documents added
- detailed handoff reinforcement added
- coverage ledger added
- remaining gaps documented

track_c_not_completed_for:
- implementation
- DB apply
- API payload finalization
- UI implementation
- integrated markdown regeneration
- runtime verification

# ============================================================
# 2. WHAT TRACK C FIXED
# ============================================================

fixed:
- 52.master-data owns shared customer / business partner identity.
- 03.crm owns account / contact / relationship / interaction / case truth.
- 02.sfa owns lead / qualification / opportunity / activity / pipeline truth.
- 01.sales owns quote / price / discount / promotion / commercial pre-order truth.
- 04.order-management owns accepted order truth.
- 05.billing owns invoice and billing feedback truth.
- 06.demand-forecasting owns demand forecast truth.
- 60.business-intelligence owns analytical projection only.
- CRM/SFA/Sales commercial signals are forecast inputs only.
- Quote-to-order basis is not accepted order until 04 intake.
- Billing feedback does not rewrite quote, opportunity, or CRM relationship truth directly.

# ============================================================
# 3. TRACK C DOCUMENT SET
# ============================================================

track_c_document_set:
- 9200000327_COMMERCIAL_CRM_SFA_SALES_BOUNDARY_MEMO.md
- 9203000001_CRM_CUSTOMER_ACCOUNT_CONTACT_INTERACTION_EXACT_DESIGN.md
- 9202000001_SFA_LEAD_OPPORTUNITY_ACTIVITY_PIPELINE_EXACT_DESIGN.md
- 9201000002_SALES_PRICE_DISCOUNT_PROMOTION_QUOTE_EXACT_DESIGN.md
- 9200000328_COMMERCIAL_DETAILED_HANDOFF_REINFORCEMENT_MEMO.md
- 9203000002_CRM_TO_SFA_FORECAST_BILLING_FEEDBACK_HANDOFF_EXACT.md
- 9202000002_SFA_TO_SALES_DEMAND_ORDER_FEEDBACK_HANDOFF_EXACT.md
- 9201000003_SALES_TO_DEMAND_ORDER_BILLING_FEEDBACK_HANDOFF_EXACT.md
- 9206000002_COMMERCIAL_SIGNAL_INTAKE_EXACT_DESIGN.md
- 9204000002_COMMERCIAL_ORDER_INTAKE_AND_FEEDBACK_EXACT.md
- 9205000003_BILLING_COMMERCIAL_FEEDBACK_EXACT.md
- 9200000329_TRACK_C_COMMERCIAL_SIDE_DEEPENING_INDEX.md
- 9200000330_TRACK_C_COMMERCIAL_SIDE_COVERAGE_LEDGER.md

# ============================================================
# 4. NEXT TRACK D SCOPE
# ============================================================

track_d_scope:
- 52.master-data
- 03.crm
- 02.sfa
- 01.sales
- 10.purchase
- 11.procurement
- 12.inventory
- 13.warehouse
- 14.logistics
- 15.manufacturing
- 16.production-planning
- 17.quality
- 18.costing
- 19.asset-management
- 30.accounting
- 33.fixed-assets
- 34.cash-management
- 40.human-resources
- 41.labor-management
- 42.payroll

track_d_goal:
- Expand generic 52.master-data design into concrete master catalogs and
  source-module extension maps.

# ============================================================
# 5. TRACK D RECOMMENDED FIRST BUNDLE
# ============================================================

track_d_first_bundle:
- customer / business partner / contact master catalog exact design
- supplier / business partner master catalog exact design
- item / product / UOM master catalog exact design
- location / site / address / warehouse reference catalog exact design
- company / legal entity / organization reference catalog exact design
- source module extension map by master domain

reason:
- Tracks A/B/C now rely on master references.
- 52.master-data generic governance is fixed, but concrete master catalogs remain thin.
- Exact master catalogs will stabilize all source module references before integrated regeneration.

# ============================================================
# 6. TRACK D START PRINCIPLE
# ============================================================

track_d_start_principle:
- 52.master-data owns shared identity/reference catalogs.
- Source modules own domain extensions and transaction truth.
- Master catalog changes must preserve version/effective-date/lineage.
- Master merge/split/deactivation must not silently rewrite source transaction history.
- BI consumes master dimensions/snapshots only.
- Approval and audit support governance but do not own master truth.

# ============================================================
# 7. COMPLETION STATE
# ============================================================

completion_state:
- Track C completion note created.
- Track D start recommendation fixed.
- ERP can continue to master-data catalog deepening next.

# ============================================================

