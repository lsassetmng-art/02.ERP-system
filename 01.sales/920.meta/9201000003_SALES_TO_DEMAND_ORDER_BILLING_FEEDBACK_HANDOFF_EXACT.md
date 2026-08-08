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
