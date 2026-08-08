# ============================================================
# ACCOUNTING AP / AR / SUBLEDGER / POSTING EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 30.accounting
track: Track B
related_modules:
- 05.billing
- 10.purchase
- 18.costing
- 32.project-accounting
- 33.fixed-assets
- 34.cash-management
- 42.payroll
- 60.business-intelligence

purpose:
Define statutory accounting truth for posting basis intake, GL journals,
subledger accounting, AP/AR accounting entries, reversals, corrections,
and accounting feedback to source modules.

canonical_role:
- statutory accounting / GL / subledger / posting truth

# ============================================================
# 1. CORE ACCOUNTING OBJECTS
# ============================================================

core_objects:
- accounting_posting_basis_intake
- accounting_document
- gl_journal
- gl_journal_line
- subledger_entry
- accounts_receivable_entry
- accounts_payable_entry
- accounting_posting_batch
- accounting_reversal
- accounting_adjustment
- accounting_posting_feedback
- accounting_period
- accounting_close_package

# ============================================================
# 2. POSTING BASIS INTAKE
# ============================================================

object_name:
- accounting_posting_basis_intake

meaning:
- controlled intake of posting basis from source modules before accounting creates accounting document or GL journal

accepted_source_basis_examples:
- billing_to_accounting_posting_basis
- payroll_to_accounting_posting_basis
- costing_to_accounting_production_actual_cost_posting_basis
- costing_to_accounting_production_variance_posting_basis
- purchase_supplier_claim_to_accounting_basis
- fixed_asset_to_accounting_posting_basis
- cash_to_accounting_bank_movement_basis
- project_accounting_to_accounting_posting_basis

required_fields:
- posting_basis_intake_id
- company_id
- source_module
- source_object_type
- source_object_id
- source_object_version_id_or_null
- posting_basis_type
- accounting_period
- currency_code
- amount_summary
- posting_line_basis_set_reference
- source_lineage_reference
- intake_status
- received_at
- validated_at_or_null
- accepted_at_or_null
- rejected_at_or_null
- rejection_reason_code_or_null
- lineage_reference

allowed_intake_status:
- received
- validation_pending
- accepted
- rejected
- posted
- cancelled
- superseded

posting_basis_type_examples:
- customer_invoice
- billing_adjustment
- supplier_invoice_or_claim
- payroll
- production_cost
- cost_variance
- fixed_asset_capitalization
- depreciation
- disposal
- bank_payment
- bank_receipt
- project_cost
- manual_adjustment_basis

acceptance_requires:
- source module resolvable
- accounting period open or acceptable under policy
- currency resolvable
- amount valid
- account mapping resolvable or derivable
- source lineage present
- duplicate not already posted

reject_reason_codes:
- INVALID_SCHEMA
- SOURCE_UNRESOLVABLE
- POSTING_PERIOD_CLOSED
- CURRENCY_UNRESOLVABLE
- AMOUNT_INVALID
- ACCOUNT_MAPPING_UNRESOLVABLE
- LINEAGE_MISSING
- DUPLICATE_BASIS
- SOURCE_SUPERSEDED
- POLICY_BLOCKED

rules:
- posting basis is not journal
- rejection does not delete source basis
- source module must correct or resend when rejected
- accepted basis may create accounting document / journal

# ============================================================
# 3. ACCOUNTING DOCUMENT
# ============================================================

object_name:
- accounting_document

meaning:
- canonical accounting document created by accounting module from accepted posting basis or manual accounting workflow

required_fields:
- accounting_document_id
- company_id
- document_number
- document_type
- accounting_period
- document_date
- posting_date
- source_module_or_manual
- source_posting_basis_intake_id_or_null
- currency_code
- document_amount
- document_status
- gl_journal_reference_set
- subledger_reference_set_or_null
- created_at
- created_by
- approved_at_or_null
- posted_at_or_null
- lineage_reference

document_type_examples:
- customer_invoice_posting
- customer_credit_memo_posting
- supplier_invoice_posting
- supplier_claim_posting
- payroll_posting
- production_cost_posting
- depreciation_posting
- asset_disposal_posting
- cash_payment_posting
- cash_receipt_posting
- manual_adjustment
- reversal

allowed_document_status:
- draft
- validation_pending
- approved
- posted
- reversed
- corrected
- cancelled
- superseded

rules:
- accounting document belongs to 30
- source business document remains in source module
- correction requires reversal/adjustment/successor accounting document
- deletion of posted document is forbidden

# ============================================================
# 4. GL JOURNAL
# ============================================================

object_name:
- gl_journal

meaning:
- canonical general ledger journal

required_fields:
- gl_journal_id
- company_id
- accounting_document_id
- journal_number
- ledger_id
- accounting_period
- journal_date
- posting_date
- journal_type
- journal_status
- debit_total
- credit_total
- currency_code
- journal_line_set
- source_module_or_manual
- source_reference_set
- posted_at_or_null
- posted_by_or_system_actor
- reversal_of_journal_id_or_null
- correction_reason_or_null
- lineage_reference

journal_type_examples:
- revenue
- receivable
- payable
- expense
- payroll
- inventory
- production_cost
- fixed_asset
- depreciation
- cash
- accrual
- adjustment
- reversal

allowed_journal_status:
- draft
- balanced
- validation_pending
- posted
- reversed
- corrected
- cancelled
- superseded

rules:
- GL journal belongs to 30
- posted journal is immutable
- reversal requires reversal journal
- correction requires adjustment or correction journal
- journal must balance unless policy explicitly allows suspense workflow

# ============================================================
# 5. GL JOURNAL LINE
# ============================================================

object_name:
- gl_journal_line

required_fields:
- gl_journal_line_id
- gl_journal_id
- line_number
- account_id
- debit_amount_or_null
- credit_amount_or_null
- currency_code
- cost_center_id_or_null
- profit_center_id_or_null
- project_id_or_null
- asset_id_or_null
- customer_id_or_null
- supplier_id_or_null
- tax_code_or_null
- source_line_reference_or_null
- line_description_or_null
- lineage_reference

rules:
- line account assignment belongs to accounting
- source line reference remains traceable
- management accounting may consume dimensions, not own GL line

# ============================================================
# 6. SUBLEDGER / AP / AR
# ============================================================

object_name:
- subledger_entry

required_fields:
- subledger_entry_id
- company_id
- subledger_type
- accounting_document_id
- gl_journal_id_or_null
- source_module
- source_object_type
- source_object_id
- party_master_reference_or_null
- amount
- currency_code
- due_date_or_null
- subledger_status
- created_at
- lineage_reference

subledger_type_examples:
- accounts_receivable
- accounts_payable
- fixed_assets
- payroll_liability
- tax
- inventory
- project

allowed_subledger_status:
- open
- partially_cleared
- cleared
- disputed
- reversed
- written_off
- cancelled
- superseded

object_name:
- accounts_receivable_entry

required_fields:
- ar_entry_id
- company_id
- customer_id
- source_billing_reference
- accounting_document_id
- invoice_amount
- open_amount
- currency_code
- due_date
- ar_status
- cash_receipt_reference_set_or_null
- lineage_reference

allowed_ar_status:
- open
- partially_paid
- paid
- disputed
- credited
- written_off
- reversed
- cancelled

object_name:
- accounts_payable_entry

required_fields:
- ap_entry_id
- company_id
- supplier_id_or_payee_id
- source_purchase_or_claim_or_payment_basis_reference
- accounting_document_id
- payable_amount
- open_amount
- currency_code
- due_date
- ap_status
- cash_payment_reference_set_or_null
- lineage_reference

allowed_ap_status:
- open
- payment_pending
- partially_paid
- paid
- disputed
- credited
- reversed
- cancelled

rules:
- AP/AR accounting entries belong to 30
- cash execution belongs to 34
- source invoice/claim/payroll remains in source module
- clearing must reference cash movement or approved clearing basis

# ============================================================
# 7. ACCOUNTING POSTING BATCH
# ============================================================

object_name:
- accounting_posting_batch

required_fields:
- posting_batch_id
- company_id
- batch_type
- posting_basis_intake_set
- accounting_document_set
- batch_status
- accounting_period
- created_at
- created_by_or_system_actor
- posted_at_or_null
- error_count
- warning_count
- lineage_reference

batch_type_examples:
- billing_batch
- payroll_batch
- costing_batch
- fixed_asset_batch
- cash_batch
- manual_batch
- mixed_source_batch

allowed_batch_status:
- building
- validation_pending
- ready_to_post
- posting
- posted
- posted_with_warning
- failed
- cancelled
- superseded

rules:
- batch belongs to 30
- failed batch must not corrupt posted journals
- source modules receive feedback

# ============================================================
# 8. REVERSAL / ADJUSTMENT
# ============================================================

object_name:
- accounting_reversal

required_fields:
- accounting_reversal_id
- company_id
- original_accounting_document_id
- original_gl_journal_id_or_null
- reversal_reason
- reversal_document_id_or_null
- reversal_status
- requested_by
- requested_at
- approved_at_or_null
- lineage_reference

allowed_reversal_status:
- requested
- approval_pending
- approved
- posted
- rejected
- cancelled
- superseded

object_name:
- accounting_adjustment

required_fields:
- accounting_adjustment_id
- company_id
- adjustment_type
- adjustment_reason
- affected_accounting_document_id_or_null
- adjustment_document_id_or_null
- amount
- currency_code
- adjustment_status
- approval_reference_or_null
- created_at
- lineage_reference

adjustment_type_examples:
- accrual
- deferral
- correction
- reclassification
- write_off
- tax_adjustment
- period_close_adjustment
- manual_adjustment

rules:
- reversal/adjustment belongs to 30
- source correction may also be required separately
- source transaction is not silently changed by accounting adjustment

# ============================================================
# 9. ACCOUNTING FEEDBACK TO SOURCE
# ============================================================

handoff_object_name:
- accounting_posting_feedback

required_fields:
- posting_feedback_id
- company_id
- source_module
- source_object_type
- source_object_id
- posting_basis_intake_id
- accounting_document_id_or_null
- gl_journal_id_or_null
- posting_feedback_status
- rejection_reason_code_or_null
- rejection_detail_or_null
- posted_at_or_null
- lineage_reference

allowed_posting_feedback_status:
- accepted
- rejected
- posted
- reversed
- corrected
- cancelled
- superseded

rules:
- feedback informs source module
- accounting feedback does not mutate source source truth unless source module applies its own update
- posted feedback may update source posting status only through source workflow

# ============================================================
# 10. OUTPUT TO CASH / BI / MA
# ============================================================

cash_relationship:
- AP/AR open entries may feed payment/receipt processes in 34.cash-management
- 34 owns cash execution
- accounting owns AP/AR accounting truth and clearing entries

BI_consumable_outputs:
- GL journal snapshot
- accounting document snapshot
- AP/AR aging snapshot
- trial balance snapshot
- posting batch snapshot
- reversal/adjustment snapshot

MA_consumable_outputs:
- management accounting consumes accounting actuals through controlled handoff/read model
- MA does not own statutory journal truth

# ============================================================
# 11. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- posting basis treated as GL journal
- cash payment treated as accounting posting without accounting workflow
- BI dashboard posting accounting entry
- source module editing posted GL journal
- accounting adjustment silently changing source invoice/payroll/cost truth
- AP/AR cleared status without cash/clearing reference
- deleting posted journals
- management accounting allocation overwriting GL journal

# ============================================================
# 12. DECISION TEST
# ============================================================

decision_test:
- If it is GL journal, accounting document, AP/AR entry, posting batch, reversal, or adjustment, 30 owns it.
- If it is invoice/payroll/cost/purchase source truth, source module owns it.
- If it is bank transfer or cash receipt execution, 34 owns it.
- If it is management interpretation, 31 owns it.
- If it is dashboard projection, 60 owns it.

# ============================================================
# 13. COMPLETION STATE
# ============================================================

completion_state:
- accounting AP/AR/subledger/posting exact design fixed
- posting basis intake fixed
- GL journal immutability fixed
- AP/AR and subledger ownership fixed
- reversal/adjustment/feedback boundary fixed

# ============================================================
