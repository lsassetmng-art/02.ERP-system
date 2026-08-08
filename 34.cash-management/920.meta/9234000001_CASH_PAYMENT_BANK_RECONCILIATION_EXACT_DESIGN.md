# ============================================================
# CASH PAYMENT / RECEIPT / BANK RECONCILIATION EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 34.cash-management
track: Track B
related_modules:
- 30.accounting
- 05.billing
- 10.purchase
- 42.payroll
- 33.fixed-assets
- 60.business-intelligence

purpose:
Define cash management truth for payment execution, receipt matching,
bank statement intake, bank reconciliation, cash movement, and feedback to
accounting/source modules.

canonical_role:
- cash payment / cash receipt / bank movement / reconciliation truth

# ============================================================
# 1. CORE CASH OBJECTS
# ============================================================

core_objects:
- cash_payment_basis_intake
- cash_receipt_basis_intake
- cash_payment_batch
- cash_payment_instruction
- cash_payment_execution
- cash_receipt_event
- bank_statement
- bank_statement_line
- bank_reconciliation_run
- bank_reconciliation_match
- cash_movement_event
- cash_position_snapshot
- cash_to_accounting_bank_movement_basis
- cash_execution_feedback

# ============================================================
# 2. PAYMENT BASIS INTAKE
# ============================================================

object_name:
- cash_payment_basis_intake

meaning:
- controlled intake of payment basis from source modules

accepted_source_basis_examples:
- payroll_to_cash_payment_basis
- accounts_payable_payment_basis
- supplier_claim_payment_or_refund_basis
- tax_payment_basis
- fixed_asset_purchase_payment_basis
- manual_payment_basis

required_fields:
- payment_basis_intake_id
- company_id
- source_module
- source_object_type
- source_object_id
- payee_reference
- payment_amount
- currency_code
- requested_payment_date
- payment_method
- bank_account_reference_or_null
- payment_line_set_reference
- intake_status
- received_at
- lineage_reference

payment_method_examples:
- bank_transfer
- direct_debit
- cash
- check
- card
- internal_transfer
- manual_external_payment

allowed_intake_status:
- received
- validation_pending
- accepted
- rejected
- scheduled
- cancelled
- superseded

acceptance_requires:
- source module resolvable
- payee resolvable
- amount valid
- currency resolvable
- payment method supported
- bank account/payment route resolvable where required
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- SOURCE_UNRESOLVABLE
- PAYEE_UNRESOLVABLE
- AMOUNT_INVALID
- CURRENCY_UNRESOLVABLE
- PAYMENT_METHOD_UNSUPPORTED
- BANK_ACCOUNT_UNRESOLVABLE
- PAYMENT_DATE_INVALID
- MISSING_LINEAGE
- DUPLICATE_PAYMENT_BASIS

rules:
- payment basis is not payment execution
- accepted basis may become payment instruction/batch
- source module owns source liability/payroll/invoice truth

# ============================================================
# 3. CASH PAYMENT BATCH / INSTRUCTION
# ============================================================

object_name:
- cash_payment_batch

required_fields:
- payment_batch_id
- company_id
- payment_batch_type
- payment_basis_intake_set
- total_payment_amount
- currency_code_or_mixed_flag
- payment_method
- source_bank_account_reference
- batch_status
- scheduled_payment_date
- created_at
- created_by
- approved_at_or_null
- executed_at_or_null
- lineage_reference

payment_batch_type_examples:
- payroll
- supplier_payment
- tax_payment
- refund
- internal_transfer
- manual

allowed_batch_status:
- building
- validation_pending
- approval_pending
- approved
- scheduled
- executing
- executed
- partially_executed
- failed
- cancelled
- superseded

object_name:
- cash_payment_instruction

required_fields:
- payment_instruction_id
- company_id
- payment_batch_id
- payee_reference
- payment_amount
- currency_code
- payment_method
- source_bank_account_reference
- destination_bank_account_reference_or_null
- instruction_status
- scheduled_payment_date
- execution_reference_or_null
- lineage_reference

allowed_instruction_status:
- draft
- ready
- submitted_to_bank
- accepted_by_bank
- rejected_by_bank
- executed
- failed
- cancelled
- superseded

rules:
- payment instruction belongs to 34
- instruction does not equal bank execution until execution evidence exists
- rejection must be fed back to source and accounting where applicable

# ============================================================
# 4. CASH PAYMENT EXECUTION
# ============================================================

object_name:
- cash_payment_execution

meaning:
- canonical cash/bank payment execution result

required_fields:
- payment_execution_id
- company_id
- payment_instruction_id
- payment_batch_id_or_null
- bank_transaction_reference_or_null
- executed_amount
- currency_code
- execution_status
- executed_at_or_null
- bank_response_code_or_null
- bank_response_detail_or_null
- failure_reason_or_null
- reversal_reference_or_null
- lineage_reference

allowed_execution_status:
- submitted
- bank_accepted
- executed
- partially_executed
- rejected
- failed
- reversed
- cancelled
- superseded

rules:
- payment execution belongs to 34
- payslip issue is not payment execution
- AP entry is not payment execution
- accounting clearing must go through 30 workflow

# ============================================================
# 5. CASH RECEIPT EVENT
# ============================================================

object_name:
- cash_receipt_event

meaning:
- cash/bank receipt recognized by cash management

required_fields:
- cash_receipt_event_id
- company_id
- payer_reference_or_unknown
- received_amount
- currency_code
- received_at
- bank_transaction_reference_or_null
- source_reference_or_null
- receipt_status
- matched_ar_reference_or_null
- unmatched_reason_or_null
- lineage_reference

allowed_receipt_status:
- received
- matched
- partially_matched
- unmatched
- disputed
- reversed
- cancelled
- superseded

rules:
- cash receipt belongs to 34
- AR accounting entry belongs to 30
- invoice truth belongs to 05.billing
- matching feedback may clear AR through accounting workflow

# ============================================================
# 6. BANK STATEMENT / LINE
# ============================================================

object_name:
- bank_statement

required_fields:
- bank_statement_id
- company_id
- bank_account_reference
- statement_number_or_reference
- statement_period_start
- statement_period_end
- opening_balance
- closing_balance
- currency_code
- statement_status
- imported_at
- source_file_or_api_reference_or_null
- lineage_reference

allowed_statement_status:
- imported
- validation_pending
- validated
- reconciliation_pending
- reconciled
- rejected
- superseded

object_name:
- bank_statement_line

required_fields:
- bank_statement_line_id
- bank_statement_id
- transaction_date
- value_date_or_null
- transaction_reference_or_null
- description
- debit_amount_or_null
- credit_amount_or_null
- currency_code
- bank_counterparty_reference_or_null
- line_status
- matched_cash_movement_reference_or_null
- lineage_reference

allowed_line_status:
- imported
- matched
- partially_matched
- unmatched
- disputed
- ignored
- corrected
- superseded

rules:
- bank statement belongs to 34
- bank statement line is bank evidence
- bank line is not GL journal
- reconciliation result may feed accounting

# ============================================================
# 7. BANK RECONCILIATION
# ============================================================

object_name:
- bank_reconciliation_run

required_fields:
- reconciliation_run_id
- company_id
- bank_account_reference
- reconciliation_period_start
- reconciliation_period_end
- bank_statement_id_set
- cash_movement_reference_set
- reconciliation_status
- matched_count
- unmatched_count
- exception_count
- started_at
- completed_at_or_null
- lineage_reference

allowed_reconciliation_status:
- queued
- running
- completed
- completed_with_exception
- failed
- cancelled
- superseded

object_name:
- bank_reconciliation_match

required_fields:
- reconciliation_match_id
- reconciliation_run_id
- bank_statement_line_id
- cash_movement_reference_or_accounting_reference
- match_type
- match_status
- matched_amount
- currency_code
- variance_amount_or_null
- matched_at
- matched_by_or_system_actor
- lineage_reference

match_type_examples:
- exact
- amount_date
- reference
- manual
- partial
- many_to_one
- one_to_many

allowed_match_status:
- proposed
- confirmed
- rejected
- disputed
- corrected
- superseded

rules:
- reconciliation belongs to 34
- accounting clearing/posting belongs to 30
- unmatched lines must remain visible
- manual match must retain actor and reason

# ============================================================
# 8. CASH MOVEMENT EVENT
# ============================================================

object_name:
- cash_movement_event

meaning:
- canonical cash-side movement event

required_fields:
- cash_movement_event_id
- company_id
- bank_account_reference_or_cash_account_reference
- movement_type
- amount
- currency_code
- movement_date
- source_cash_object_type
- source_cash_object_id
- bank_statement_line_reference_or_null
- accounting_feedback_reference_or_null
- movement_status
- lineage_reference

movement_type_examples:
- payment
- receipt
- internal_transfer
- bank_fee
- interest
- reversal
- correction
- unknown_bank_movement

allowed_movement_status:
- recorded
- reconciled
- pending_accounting
- sent_to_accounting
- accepted_by_accounting
- rejected_by_accounting
- reversed
- cancelled
- superseded

rules:
- cash movement belongs to 34
- GL posting belongs to 30
- bank evidence remains traceable

# ============================================================
# 9. CASH TO ACCOUNTING BASIS
# ============================================================

handoff_object_name:
- cash_to_accounting_bank_movement_basis

meaning:
- cash-side basis for accounting posting/clearing

required_fields:
- cash_accounting_basis_id
- company_id
- source_module
- target_module
- cash_movement_event_id
- bank_account_reference
- movement_type
- amount
- currency_code
- movement_date
- related_ap_ar_reference_or_null
- bank_statement_line_reference_or_null
- accounting_basis_status
- created_at
- lineage_reference

allowed_accounting_basis_status:
- building
- handoff_ready
- sent_to_accounting
- accepted_by_accounting
- rejected_by_accounting
- posted
- cancelled
- superseded

rules:
- source_module must be 34.cash-management
- target_module must be 30.accounting
- accounting basis is not GL journal
- 30 owns posting/clearing

# ============================================================
# 10. FEEDBACK TO SOURCE MODULES
# ============================================================

feedback_object_name:
- cash_execution_feedback

required_fields:
- cash_execution_feedback_id
- company_id
- target_source_module
- source_object_type
- source_object_id
- payment_or_receipt_reference
- execution_status
- amount
- currency_code
- executed_at_or_null
- rejection_or_failure_reason_or_null
- accounting_reference_or_null
- lineage_reference

rules:
- payroll may update payment status from cash feedback
- purchase/AP may update payment status from cash feedback
- billing/AR may update receipt status from cash feedback
- source modules must not fabricate cash execution

# ============================================================
# 11. CASH POSITION SNAPSHOT
# ============================================================

object_name:
- cash_position_snapshot

required_fields:
- cash_position_snapshot_id
- company_id
- snapshot_at
- bank_account_set
- cash_balance_total_by_currency
- expected_inflow_summary_or_null
- expected_outflow_summary_or_null
- unreconciled_amount_summary_or_null
- snapshot_status
- lineage_reference

allowed_snapshot_status:
- building
- completed
- completed_with_warning
- failed
- superseded

rules:
- cash position snapshot belongs to 34
- BI may consume snapshot
- snapshot is not bank statement or GL journal

# ============================================================
# 12. OUTPUT TO BI
# ============================================================

BI_consumable_outputs:
- payment batch snapshot
- payment execution snapshot
- receipt event snapshot
- bank statement snapshot
- reconciliation run snapshot
- cash position snapshot
- unmatched bank line snapshot

rules:
- BI does not execute payment
- BI does not reconcile bank lines
- BI does not post journal

# ============================================================
# 13. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- payment basis treated as executed payment
- payslip treated as salary transfer completion
- AP open entry treated as supplier payment completion
- bank statement line treated as GL journal
- reconciliation match posting accounting journal directly without 30 workflow
- BI dashboard marking payment executed
- source module editing cash execution status directly
- deleting bank statement line after reconciliation

# ============================================================
# 14. DECISION TEST
# ============================================================

decision_test:
- If it is payment/receipt/bank statement/reconciliation/cash movement, 34 owns it.
- If it is GL/AP/AR accounting entry, 30 owns it.
- If it is invoice/payroll/purchase source truth, source module owns it.
- If it is dashboard projection, 60 owns it.

# ============================================================
# 15. COMPLETION STATE
# ============================================================

completion_state:
- cash payment / receipt exact design fixed
- bank statement and reconciliation fixed
- cash-to-accounting basis fixed
- source feedback boundary fixed
- BI projection boundary fixed

# ============================================================
