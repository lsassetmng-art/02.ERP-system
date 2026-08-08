# ============================================================
# BILLING / INVOICE / REVENUE BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 05.billing
related_modules:
- 04.order-management
- 14.logistics
- 30.accounting
- 60.business-intelligence

purpose:
Define billing eligibility, invoice truth, billing adjustments, and accounting
handoff without taking over order, logistics, or accounting truth.

canonical_role:
- billing / invoice / customer charge truth

# ============================================================
# 1. CORE BILLING OBJECTS
# ============================================================

core_objects:
- billing_policy
- billing_eligibility_evaluation
- invoice_request_intake
- customer_invoice
- customer_invoice_line
- billing_schedule
- billing_adjustment
- credit_memo
- debit_memo
- billing_cancellation
- billing_to_accounting_posting_basis

# ============================================================
# 2. INPUTS
# ============================================================

accepted_input_objects:
- order_to_billing_invoice_request
- logistics_to_billing_delivery_evidence

rules:
- order request may indicate billing candidate
- delivery evidence may satisfy delivery-based billing trigger
- billing decides invoice creation according to billing policy
- invoice belongs to 05.billing

# ============================================================
# 3. BILLING ELIGIBILITY EVALUATION
# ============================================================

object_name:
- billing_eligibility_evaluation

required_fields:
- billing_eligibility_id
- company_id
- customer_id
- sales_order_id_or_null
- invoice_request_id_or_null
- delivery_evidence_id_or_null
- billing_policy_reference
- trigger_type
- eligibility_status
- evaluated_at
- evaluated_by_system_actor
- blocking_reason_set_or_null
- lineage_reference

trigger_type_examples:
- order_acceptance
- shipment
- delivery
- milestone
- service_completion
- subscription_period
- manual_approved

allowed_eligibility_status:
- pending
- eligible
- blocked
- rejected
- superseded
- cancelled

rules:
- eligible does not equal invoice posted to accounting
- blocked must preserve reason
- billing eligibility evaluation does not mutate order or delivery truth

# ============================================================
# 4. CUSTOMER INVOICE
# ============================================================

object_name:
- customer_invoice

meaning:
- canonical customer billing document

required_fields:
- customer_invoice_id
- company_id
- customer_id
- invoice_number
- invoice_status
- invoice_date
- due_date_or_null
- currency_code
- source_invoice_request_reference_or_null
- source_delivery_evidence_reference_or_null
- invoice_line_set
- subtotal_amount
- tax_amount_or_null
- total_amount
- billing_policy_reference
- payment_terms_reference_or_null
- created_at
- created_by
- updated_at
- updated_by
- lineage_reference

allowed_invoice_status:
- draft
- validation_pending
- issued
- sent
- partially_paid
- paid
- disputed
- adjusted
- cancelled
- credited
- closed
- superseded

rules:
- invoice is billing truth
- invoice does not rewrite sales order
- invoice does not rewrite proof of delivery
- accounting posting belongs to 30.accounting
- payment/cash truth belongs to cash management where applicable

# ============================================================
# 5. CUSTOMER INVOICE LINE
# ============================================================

object_name:
- customer_invoice_line

required_fields:
- customer_invoice_line_id
- customer_invoice_id
- line_number
- sales_order_line_id_or_null
- item_id_or_service_id
- billed_quantity
- quantity_uom
- unit_price_or_condition_reference
- line_amount
- tax_condition_reference_or_null
- delivery_reference_or_null
- milestone_reference_or_null
- line_status
- lineage_reference

allowed_line_status:
- draft
- issued
- adjusted
- credited
- cancelled
- closed

rules:
- billed quantity is billing truth
- difference from order/delivery must be traceable
- correction requires billing adjustment / credit / debit workflow
- invoice line does not change order line quantity

# ============================================================
# 6. BILLING ADJUSTMENT / CREDIT / DEBIT
# ============================================================

object_name:
- billing_adjustment

required_fields:
- billing_adjustment_id
- company_id
- customer_invoice_id
- adjustment_type
- adjustment_reason
- adjustment_amount
- currency_code
- source_reference_or_null
- approval_reference_or_null
- adjustment_status
- created_at
- created_by
- lineage_reference

adjustment_type_examples:
- price_correction
- quantity_correction
- tax_correction
- discount_correction
- delivery_failure_credit
- return_credit
- manual_adjustment

allowed_adjustment_status:
- draft
- approval_pending
- approved
- applied
- rejected
- cancelled
- superseded

rules:
- adjustment changes billing truth
- adjustment does not mutate source delivery or order truth
- accounting impact must go through 30 workflow

# ============================================================
# 7. BILLING TO ACCOUNTING POSTING BASIS
# ============================================================

handoff_object_name:
- billing_to_accounting_posting_basis

required_fields:
- posting_basis_id
- company_id
- source_module
- target_module
- customer_invoice_id
- invoice_number
- customer_id
- invoice_date
- currency_code
- invoice_amount
- tax_amount_or_null
- revenue_accounting_basis_reference_or_null
- receivable_basis_reference_or_null
- adjustment_reference_set_or_null
- posting_basis_status
- created_at
- created_by
- lineage_reference

allowed_posting_basis_status:
- building
- handoff_ready
- sent_to_accounting
- accepted_by_accounting
- rejected_by_accounting
- posted
- cancelled
- superseded

rules:
- source_module must be 05.billing
- target_module must be 30.accounting
- posting basis is not GL journal
- 30.accounting owns posting / journal truth
- rejected posting basis requires billing correction or resend workflow

# ============================================================
# 8. OUTPUT TO BI
# ============================================================

BI_consumable_outputs:
- invoice status snapshot
- billing eligibility snapshot
- invoice amount snapshot
- adjustment snapshot
- billing aging basis where applicable
- posting basis status snapshot

rules:
- BI consumes snapshots only
- BI may not issue invoice
- BI may not adjust invoice
- BI may not post accounting journal

# ============================================================
# 9. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- order accepted directly treated as invoice without billing policy
- proof of delivery directly treated as invoice
- invoice directly changing delivery proof
- invoice directly changing stock ledger
- billing adjustment directly changing sales order
- billing posting basis treated as GL journal
- BI dashboard issuing invoice
- accounting journal directly editing invoice without billing workflow

# ============================================================
# 10. DECISION TEST
# ============================================================

decision_test:
- If it is billing eligibility / invoice / billing adjustment, 05 owns it.
- If it is accepted order, 04 owns it.
- If it is delivery proof, 14 owns it.
- If it is accounting journal, 30 owns it.
- If it is dashboard projection, 60 owns it.

# ============================================================
# 11. COMPLETION STATE
# ============================================================

completion_state:
- billing / invoice truth fixed
- invoice request and delivery evidence intake fixed
- billing adjustment boundary fixed
- billing to accounting posting basis fixed

# ============================================================
