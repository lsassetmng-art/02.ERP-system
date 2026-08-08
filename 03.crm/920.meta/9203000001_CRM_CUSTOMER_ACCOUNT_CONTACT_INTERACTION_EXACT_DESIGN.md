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
