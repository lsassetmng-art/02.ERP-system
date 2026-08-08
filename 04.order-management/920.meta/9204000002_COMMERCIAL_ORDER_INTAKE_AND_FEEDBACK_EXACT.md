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
