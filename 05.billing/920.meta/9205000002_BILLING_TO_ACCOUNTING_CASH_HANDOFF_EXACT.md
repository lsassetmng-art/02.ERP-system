# ============================================================
# BILLING TO ACCOUNTING / CASH HANDOFF EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 05.billing
target_modules:
- 30.accounting
- 34.cash-management

purpose:
Define exact billing handoffs to accounting and cash management without
allowing billing to own GL journal, AR clearing, cash receipt, or reconciliation.

canonical_role:
- billing / invoice / customer charge truth

# ============================================================
# 1. ACCOUNTING HANDOFF
# ============================================================

handoff_object_name:
- billing_to_accounting_invoice_posting_basis

required_fields:
- invoice_posting_basis_id
- company_id
- source_module
- target_module
- customer_invoice_id
- invoice_number
- customer_id
- invoice_date
- due_date_or_null
- currency_code
- invoice_amount
- tax_amount_or_null
- revenue_line_basis_set
- receivable_basis_reference
- billing_adjustment_reference_set_or_null
- posting_basis_status
- created_at
- created_by
- lineage_reference

revenue_line_basis_required_fields:
- revenue_line_basis_id
- customer_invoice_line_id
- item_id_or_service_id
- line_amount
- tax_amount_or_null
- revenue_account_mapping_reference_or_null
- source_order_reference_or_null
- source_delivery_reference_or_null

allowed_posting_basis_status:
- building
- validation_pending
- handoff_ready
- sent_to_accounting
- accepted_by_accounting
- rejected_by_accounting
- posted
- corrected
- cancelled
- superseded

rules:
- source_module must be 05.billing
- target_module must be 30.accounting
- posting basis is not GL journal
- AR entry belongs to 30.accounting
- accounting rejection requires billing correction/resend workflow

# ============================================================
# 2. CASH RECEIPT EXPECTATION
# ============================================================

handoff_object_name:
- billing_to_cash_receipt_expectation_basis

meaning:
- billing-side expected customer receipt basis for cash management

required_fields:
- cash_receipt_expectation_basis_id
- company_id
- source_module
- target_module
- customer_invoice_id
- customer_id
- expected_receipt_amount
- currency_code
- due_date_or_null
- payment_terms_reference_or_null
- preferred_payment_method_or_null
- bank_account_reference_or_null
- receipt_matching_reference
- expectation_status
- created_at
- lineage_reference

allowed_expectation_status:
- building
- handoff_ready
- sent_to_cash_management
- accepted_by_cash_management
- rejected_by_cash_management
- matched_to_receipt
- partially_matched
- cancelled
- superseded

rules:
- source_module must be 05.billing
- target_module must be 34.cash-management
- receipt expectation is not cash receipt
- 34 owns cash receipt and bank matching
- 30 owns AR clearing / accounting posting

# ============================================================
# 3. ACCOUNTING FEEDBACK INTAKE
# ============================================================

accepted_feedback_object:
- accounting_posting_feedback

feedback_meaning:
- accounting has accepted/rejected/posted/reversed/corrected billing posting basis

billing_response_rules:
- if accepted_by_accounting, billing may mark posting_basis accepted
- if posted, billing may mark invoice accounting_posted
- if rejected, billing must correct or cancel posting basis
- billing may not alter GL journal

# ============================================================
# 4. CASH FEEDBACK INTAKE
# ============================================================

accepted_feedback_object:
- cash_execution_feedback

feedback_meaning:
- cash management has matched/received/rejected/customer payment evidence

billing_response_rules:
- matched receipt may update invoice payment status through billing workflow
- partially matched receipt may update partial payment status
- rejected/unmatched receipt must not mark invoice paid
- billing does not own bank statement or reconciliation

# ============================================================
# 5. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- invoice issue treated as GL posting
- invoice issue treated as cash receipt
- delivery proof treated as AR clearing
- cash receipt treated as invoice correction
- accounting rejection directly editing invoice amount
- billing directly clearing AR without accounting workflow
- BI dashboard marking invoice paid

# ============================================================
# 6. COMPLETION STATE
# ============================================================

completion_state:
- billing to accounting posting basis fixed
- billing to cash receipt expectation fixed
- accounting/cash feedback boundaries fixed
- invoice vs AR vs cash receipt separation fixed

# ============================================================
