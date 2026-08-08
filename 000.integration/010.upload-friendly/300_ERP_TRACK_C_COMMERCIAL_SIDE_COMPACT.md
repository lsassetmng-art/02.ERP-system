# ============================================================
# ERP TRACK C COMMERCIAL-SIDE COMPACT
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

# 1. Ownership

ownership:
- 52.master-data owns shared customer / business partner identity.
- 03.crm owns account / contact / relationship / interaction / case truth.
- 02.sfa owns lead / qualification / opportunity / activity / pipeline truth.
- 01.sales owns quote / price / discount / promotion / commercial pre-order truth.
- 04.order-management owns accepted order truth.
- 05.billing owns invoice and billing feedback truth.
- 06.demand-forecasting owns demand forecast truth.
- 60.business-intelligence owns analytical projection only.

# 2. Fixed objects

CRM:
- crm_customer_master_reference_intake
- crm_account_profile
- crm_contact_profile
- crm_account_contact_relationship
- crm_customer_relationship_status
- crm_customer_segment_assignment
- crm_customer_preference
- crm_interaction
- crm_case_or_inquiry
- crm_to_sfa_lead_candidate
- crm_to_demand_forecasting_customer_signal
- billing_to_crm_customer_billing_signal

SFA:
- sfa_lead
- sfa_lead_qualification
- sfa_opportunity
- sfa_opportunity_stage_history
- sfa_sales_activity
- sfa_pipeline_forecast_signal
- sfa_to_sales_quote_request_basis
- sfa_to_demand_forecasting_pipeline_signal
- sales_to_sfa_quote_feedback
- order_to_sfa_win_loss_feedback

Sales:
- sales_quote_request_intake
- sales_price_condition
- sales_discount_condition
- sales_promotion
- sales_promotion_condition
- sales_quote
- sales_quote_line
- sales_quote_revision
- sales_quote_approval_package
- sales_to_order_authorized_order_basis
- sales_to_demand_forecasting_promotion_signal

Demand:
- demand_commercial_signal_intake
- demand_commercial_signal_normalization
- demand_forecast_commercial_signal_consumption
- demand_forecasting_to_commercial_signal_feedback

Order/Billing feedback:
- order_to_sales_conversion_feedback
- order_to_crm_customer_lifecycle_feedback
- billing_to_sales_invoice_feedback
- billing_to_order_billing_status_feedback

# 3. Handoff principles

handoff_principles:
- CRM candidate is not SFA lead until SFA accepts it.
- SFA quote request is not quote until Sales accepts it.
- Sales quote is not accepted order until Order Management accepts it.
- Commercial signal is not demand forecast truth until 06 processes it.
- Billing feedback does not rewrite quote, opportunity, or CRM truth directly.
- BI snapshots do not mutate source states.

# 4. Forbidden shortcuts

forbidden:
- CRM account profile creating shared customer identity without 52 workflow
- CRM candidate treated as SFA lead without intake
- SFA lead treated as customer master
- SFA opportunity treated as sales quote
- quote treated as accepted order without 04 intake
- promotion signal treated as demand forecast truth
- demand forecast rewriting opportunity amount or promotion definition
- invoice rewriting quote price condition
- billing feedback directly changing opportunity stage without SFA workflow
- BI dashboard changing CRM / SFA / Sales / Demand / Order / Billing truth

# 5. Remaining gaps

remaining_gaps:
- customer / business partner master exact payloads
- price list / discount / promotion catalog detail
- campaign management if needed
- sales target / territory / quota
- CRM consent/privacy preference catalog
- billing dispute / collection / refund
- order return lifecycle
- commercial KPI catalog
- promotion ROI and forecast impact analysis

# 6. Key source docs

source_docs:
- 9200000327_COMMERCIAL_CRM_SFA_SALES_BOUNDARY_MEMO.md
- 9203000001_CRM_CUSTOMER_ACCOUNT_CONTACT_INTERACTION_EXACT_DESIGN.md
- 9202000001_SFA_LEAD_OPPORTUNITY_ACTIVITY_PIPELINE_EXACT_DESIGN.md
- 9201000002_SALES_PRICE_DISCOUNT_PROMOTION_QUOTE_EXACT_DESIGN.md
- 9200000328_COMMERCIAL_DETAILED_HANDOFF_REINFORCEMENT_MEMO.md
- 9206000002_COMMERCIAL_SIGNAL_INTAKE_EXACT_DESIGN.md
- 9204000002_COMMERCIAL_ORDER_INTAKE_AND_FEEDBACK_EXACT.md
- 9205000003_BILLING_COMMERCIAL_FEEDBACK_EXACT.md
- 9200000329_TRACK_C_COMMERCIAL_SIDE_DEEPENING_INDEX.md
- 9200000330_TRACK_C_COMMERCIAL_SIDE_COVERAGE_LEDGER.md

# ============================================================
