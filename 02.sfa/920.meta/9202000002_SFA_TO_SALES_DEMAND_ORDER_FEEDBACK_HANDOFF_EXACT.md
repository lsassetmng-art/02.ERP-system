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
