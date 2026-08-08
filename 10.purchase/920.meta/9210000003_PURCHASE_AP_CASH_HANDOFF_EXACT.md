# ============================================================
# PURCHASE AP / CASH HANDOFF EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 10.purchase
target_modules:
- 30.accounting
- 34.cash-management

purpose:
Define purchase-side handoffs for supplier obligation, supplier claim,
purchase return, payable basis, and supplier payment basis without allowing
purchase to own AP accounting entry, GL journal, or bank execution.

canonical_role:
- purchase order / supplier commercial workflow truth

# ============================================================
# 1. ACCOUNTING HANDOFF
# ============================================================

handoff_object_name:
- purchase_to_accounting_supplier_obligation_basis

meaning:
- purchase-side basis for supplier payable, claim, return, refund, or price adjustment accounting

required_fields:
- supplier_obligation_basis_id
- company_id
- source_module
- target_module
- supplier_id
- purchase_order_id_or_null
- purchase_order_line_id_or_null
- supplier_claim_id_or_null
- purchase_return_request_id_or_null
- supplier_invoice_reference_or_null
- obligation_type
- amount
- currency_code
- tax_amount_or_null
- quantity_or_null
- quantity_uom_or_null
- evidence_reference_set
- posting_basis_status
- created_at
- lineage_reference

obligation_type_examples:
- supplier_invoice_payable
- supplier_credit_expected
- supplier_refund_expected
- supplier_claim_recovery
- purchase_return_credit
- price_adjustment
- freight_or_charge
- manual_purchase_adjustment

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
- source_module must be 10.purchase
- target_module must be 30.accounting
- posting basis is not AP entry
- AP entry / GL journal belongs to 30.accounting
- purchase remains owner of supplier commercial workflow

# ============================================================
# 2. CASH PAYMENT BASIS
# ============================================================

handoff_object_name:
- purchase_to_cash_supplier_payment_basis

meaning:
- purchase-side approved supplier payment or refund basis for cash management

required_fields:
- supplier_payment_basis_id
- company_id
- source_module
- target_module
- supplier_id
- payable_reference_or_claim_reference
- payment_reason
- payment_amount
- currency_code
- requested_payment_date
- payment_method_or_null
- supplier_bank_account_reference_or_null
- payment_hold_flag
- approval_reference_or_null
- payment_basis_status
- created_at
- lineage_reference

payment_reason_examples:
- supplier_invoice_payment
- supplier_claim_settlement
- supplier_refund_to_customer_passthrough
- purchase_return_settlement
- freight_payment
- manual_supplier_payment

allowed_payment_basis_status:
- building
- validation_pending
- handoff_ready
- sent_to_cash_management
- accepted_by_cash_management
- rejected_by_cash_management
- scheduled
- executed
- cancelled
- superseded

rules:
- source_module must be 10.purchase
- target_module must be 34.cash-management
- payment basis is not bank execution
- 34 owns actual payment execution
- 30 owns accounting clearing/posting

# ============================================================
# 3. ACCOUNTING FEEDBACK
# ============================================================

accepted_feedback_object:
- accounting_posting_feedback

purchase_response_rules:
- accepted/posting feedback may update purchase accounting status
- rejected feedback requires correction/resend
- purchase cannot edit GL journal
- purchase cannot create AP entry directly

# ============================================================
# 4. CASH FEEDBACK
# ============================================================

accepted_feedback_object:
- cash_execution_feedback

purchase_response_rules:
- executed feedback may update supplier payment status
- failed/rejected feedback keeps payment unresolved
- purchase may reopen supplier payment workflow
- purchase may not fabricate bank execution

# ============================================================
# 5. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- supplier invoice/claim directly becoming AP entry
- supplier payment basis treated as bank transfer
- supplier response directly posting GL journal
- purchase return directly clearing AP without accounting workflow
- cash execution directly changing PO commercial terms
- BI dashboard marking supplier paid

# ============================================================
# 6. COMPLETION STATE
# ============================================================

completion_state:
- purchase to accounting supplier obligation basis fixed
- purchase to cash supplier payment basis fixed
- AP/cash feedback boundaries fixed
- supplier commercial truth vs accounting/cash truth separated

# ============================================================
