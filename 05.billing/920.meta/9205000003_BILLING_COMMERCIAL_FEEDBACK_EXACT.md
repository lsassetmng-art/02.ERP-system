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
