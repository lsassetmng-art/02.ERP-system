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
