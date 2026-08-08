# ============================================================
# ERP TRACK B FINANCE-SIDE COMPACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track B
scope:
- 30.accounting
- 34.cash-management
- 33.fixed-assets
- 19.asset-management
- 05.billing
- 10.purchase
- 18.costing
- 42.payroll
- 60.business-intelligence

# 1. Ownership

ownership:
- 30.accounting owns GL / AP / AR / subledger / posting / close truth.
- 34.cash-management owns payment / receipt / bank movement / reconciliation truth.
- 33.fixed-assets owns capitalization / depreciation / impairment / transfer / disposal / retirement truth.
- 19.asset-management owns operational asset / maintenance / utilization / custody truth.
- 05.billing sends invoice posting basis and receipt expectation only.
- 10.purchase sends supplier obligation and payment basis only.
- 42.payroll sends payroll posting and salary payment basis only.
- 18.costing sends cost posting basis only.
- 60.business-intelligence owns analytical projection only.

# 2. Fixed objects

accounting:
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
- accounting_close_package

cash:
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

fixed_assets:
- fixed_asset_capitalization_candidate_intake
- fixed_asset_register
- fixed_asset_component
- fixed_asset_book
- fixed_asset_capitalization
- fixed_asset_depreciation_area
- fixed_asset_depreciation_run
- fixed_asset_impairment
- fixed_asset_transfer
- fixed_asset_disposal
- fixed_asset_retirement
- fixed_asset_to_accounting_posting_basis

asset_management:
- operational_asset_register
- operational_asset_component
- asset_assignment
- asset_location_custody
- maintenance_plan
- maintenance_schedule
- maintenance_work_order
- maintenance_execution_result
- asset_condition_record
- asset_utilization_record
- asset_downtime_event
- asset_management_to_fixed_assets_capitalization_candidate_basis

# 3. Handoffs

handoffs:
- billing_to_accounting_invoice_posting_basis
- billing_to_cash_receipt_expectation_basis
- purchase_to_accounting_supplier_obligation_basis
- purchase_to_cash_supplier_payment_basis
- payroll_to_accounting_payroll_posting_basis
- payroll_to_cash_salary_payment_basis
- costing_to_accounting_production_actual_cost_posting_basis
- fixed_assets_to_accounting_asset_posting_basis
- fixed_assets_to_cash_asset_sale_or_acquisition_cash_basis
- cash_to_accounting_bank_movement_basis

# 4. Forbidden shortcuts

forbidden:
- posting basis treated as GL journal
- payment basis treated as bank transfer execution
- invoice issue treated as AR clearing
- cash receipt treated as invoice correction
- supplier claim treated as AP journal
- payroll close treated as accounting close
- payslip issue treated as salary payment completion
- fixed asset capitalization treated as GL journal
- operational asset record treated as fixed asset accounting register
- maintenance work order changing depreciation
- BI dashboard correcting GL / AP / AR / payment / bank reconciliation / asset truth

# 5. Remaining gaps

remaining_gaps:
- chart of accounts / ledger setup catalog
- tax code / tax jurisdiction / tax invoice catalog
- bank account / payment route catalog
- supplier invoice matching exact design
- fixed asset class / depreciation method catalog
- construction-in-progress lifecycle
- collection / dunning / dispute workflow
- payment failure and retry workflow
- financial statement output exact design

# 6. Key source docs

source_docs:
- 9200000322_FINANCE_ASSET_CASH_BOUNDARY_MEMO.md
- 9230000002_ACCOUNTING_AP_AR_SUBLEDGER_POSTING_EXACT_DESIGN.md
- 9234000001_CASH_PAYMENT_BANK_RECONCILIATION_EXACT_DESIGN.md
- 9233000001_FIXED_ASSETS_CAPITALIZATION_DEPRECIATION_DISPOSAL_EXACT_DESIGN.md
- 9219000001_ASSET_MANAGEMENT_REGISTER_MAINTENANCE_UTILIZATION_EXACT_DESIGN.md
- 9200000323_FINANCE_DETAILED_HANDOFF_REINFORCEMENT_MEMO.md
- 9200000324_TRACK_B_FINANCE_SIDE_DEEPENING_INDEX.md
- 9200000325_TRACK_B_FINANCE_SIDE_COVERAGE_LEDGER.md

# ============================================================
