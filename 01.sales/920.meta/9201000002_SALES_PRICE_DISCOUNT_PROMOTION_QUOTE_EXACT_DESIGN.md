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
