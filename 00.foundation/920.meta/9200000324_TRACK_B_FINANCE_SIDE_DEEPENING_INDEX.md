# ============================================================
# ERP TRACK B FINANCE-SIDE DEEPENING INDEX
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track B
track_name: accounting / cash / fixed-assets / asset-management finance-side deepening
scope:
- 30.accounting
- 34.cash-management
- 33.fixed-assets
- 19.asset-management
- 05.billing
- 10.purchase
- 18.costing
- 42.payroll
- 31.management-accounting
- 60.business-intelligence

purpose:
Index the finance-side exact design and detailed handoff documents added
during Track B so ERP design can continue without losing current state.

# ============================================================
# 1. TRACK B POSITION
# ============================================================

track_b_position:
- Track B started after Track A production-side completion.
- Track B focuses on finance-side core:
  - statutory accounting / GL / AP / AR / subledger
  - payment / receipt / bank execution / reconciliation
  - fixed asset capitalization / depreciation / disposal
  - operational asset register / maintenance / utilization
  - source-module posting/payment handoff reinforcement
  - BI projection boundary

current_state:
- Track B finance-side exact design bundle created.
- Track B detailed handoff reinforcement created.
- This index records coverage and remaining gaps.

# ============================================================
# 2. TRACK B CREATED DOCUMENTS
# ============================================================

## 2.1 Finance-side boundary memo

docs:
- 00.foundation/920.meta/9200000322_FINANCE_ASSET_CASH_BOUNDARY_MEMO.md

fixed:
- accounting vs cash vs fixed asset vs operational asset boundary
- posting basis vs GL journal boundary
- payment basis vs cash execution boundary
- fixed asset accounting vs operational asset management boundary
- BI projection boundary

## 2.2 Accounting exact design

docs:
- 30.accounting/920.meta/9230000001_ACCOUNTING_CLOSE_TO_MA_AND_BI_BOUNDARY_EXACT.md
- 30.accounting/920.meta/9230000002_ACCOUNTING_AP_AR_SUBLEDGER_POSTING_EXACT_DESIGN.md

fixed:
- accounting close
- GL journal
- accounting document
- posting basis intake
- AP / AR / subledger entry
- posting batch
- reversal / adjustment
- accounting posting feedback
- statutory accounting truth

## 2.3 Cash management exact design

docs:
- 34.cash-management/920.meta/9234000001_CASH_PAYMENT_BANK_RECONCILIATION_EXACT_DESIGN.md

fixed:
- payment basis intake
- payment batch
- payment instruction
- payment execution
- cash receipt event
- bank statement / bank statement line
- bank reconciliation run / match
- cash movement event
- cash-to-accounting basis
- cash execution feedback

## 2.4 Fixed assets exact design

docs:
- 33.fixed-assets/920.meta/9233000001_FIXED_ASSETS_CAPITALIZATION_DEPRECIATION_DISPOSAL_EXACT_DESIGN.md
- 33.fixed-assets/920.meta/9233000002_FIXED_ASSETS_ACCOUNTING_CASH_HANDOFF_EXACT.md

fixed:
- capitalization candidate intake
- fixed asset register
- fixed asset component
- fixed asset book / depreciation area
- capitalization
- depreciation run / line
- impairment / revaluation
- transfer / disposal / retirement
- fixed-asset-to-accounting posting basis
- fixed-assets-to-cash basis
- fixed asset close package

## 2.5 Asset management exact design

docs:
- 19.asset-management/920.meta/9219000001_ASSET_MANAGEMENT_REGISTER_MAINTENANCE_UTILIZATION_EXACT_DESIGN.md

fixed:
- operational asset register
- operational asset component
- assignment / location / custody
- maintenance plan / schedule
- maintenance work order
- maintenance execution result
- maintenance material / service request
- condition / utilization / downtime
- asset-management-to-fixed-assets capitalization candidate basis
- fixed asset reference feedback

## 2.6 Finance detailed handoff reinforcement

docs:
- 00.foundation/920.meta/9200000323_FINANCE_DETAILED_HANDOFF_REINFORCEMENT_MEMO.md
- 05.billing/920.meta/9205000002_BILLING_TO_ACCOUNTING_CASH_HANDOFF_EXACT.md
- 10.purchase/920.meta/9210000003_PURCHASE_AP_CASH_HANDOFF_EXACT.md
- 42.payroll/920.meta/9242000002_PAYROLL_ACCOUNTING_CASH_REINFORCEMENT_EXACT.md
- 18.costing/920.meta/9218000004_COSTING_ACCOUNTING_CASH_BOUNDARY_REINFORCEMENT_EXACT.md
- 33.fixed-assets/920.meta/9233000002_FIXED_ASSETS_ACCOUNTING_CASH_HANDOFF_EXACT.md

fixed:
- billing-to-accounting invoice posting basis
- billing-to-cash receipt expectation basis
- purchase-to-accounting supplier obligation basis
- purchase-to-cash supplier payment basis
- payroll-to-accounting payroll posting basis
- payroll-to-cash salary payment basis
- costing-to-accounting standard cost activation / correction basis
- fixed-assets-to-accounting posting basis
- fixed-assets-to-cash asset sale/acquisition cash basis

# ============================================================
# 3. TRACK B FIXED OWNERSHIP SUMMARY
# ============================================================

ownership_summary:
- 30.accounting owns statutory accounting, GL, AP, AR, subledger, posting, adjustment, reversal, and close truth.
- 34.cash-management owns payment execution, receipt, bank movement, bank statement, cash movement, and reconciliation truth.
- 33.fixed-assets owns fixed asset accounting lifecycle: capitalization, depreciation, impairment, transfer, disposal, retirement.
- 19.asset-management owns operational asset lifecycle: maintenance, utilization, custody, condition, downtime.
- 05.billing owns invoice / billing truth.
- 10.purchase owns supplier claim / supplier commercial truth.
- 42.payroll owns payroll calculation / payslip / payroll close truth.
- 18.costing owns cost rollup / standard cost / variance truth.
- 31.management-accounting owns internal management interpretation only.
- 60.business-intelligence owns analytical projection only.

# ============================================================
# 4. TRACK B HANDOFF SUMMARY
# ============================================================

handoff_summary:
- 05.billing -> 30.accounting:
  - billing_to_accounting_invoice_posting_basis
- 05.billing -> 34.cash-management:
  - billing_to_cash_receipt_expectation_basis
- 10.purchase -> 30.accounting:
  - purchase_to_accounting_supplier_obligation_basis
- 10.purchase -> 34.cash-management:
  - purchase_to_cash_supplier_payment_basis
- 42.payroll -> 30.accounting:
  - payroll_to_accounting_payroll_posting_basis
- 42.payroll -> 34.cash-management:
  - payroll_to_cash_salary_payment_basis
- 18.costing -> 30.accounting:
  - costing_to_accounting_production_actual_cost_posting_basis
  - costing_to_accounting_production_variance_posting_basis
  - costing_to_accounting_standard_cost_activation_basis
  - costing_to_accounting_cost_correction_basis
- 33.fixed-assets -> 30.accounting:
  - fixed_assets_to_accounting_asset_posting_basis
- 33.fixed-assets -> 34.cash-management:
  - fixed_assets_to_cash_asset_sale_or_acquisition_cash_basis
- 19.asset-management -> 33.fixed-assets:
  - asset_management_to_fixed_assets_capitalization_candidate_basis
- 34.cash-management -> 30.accounting:
  - cash_to_accounting_bank_movement_basis
- 30.accounting / 34.cash-management -> source modules:
  - accounting_posting_feedback
  - cash_execution_feedback

# ============================================================
# 5. TRACK B GLOBAL FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- posting basis treated as GL journal
- payment basis treated as bank transfer execution
- invoice issue treated as AR clearing
- cash receipt treated as invoice correction
- supplier claim treated as AP journal
- payroll close treated as accounting close
- payslip issue treated as salary payment completion
- cost variance treated as GL journal
- fixed asset capitalization treated as GL journal
- fixed asset disposal treated as cash receipt
- operational asset record treated as fixed asset accounting register
- maintenance work order changing depreciation
- bank statement line directly changing invoice / payroll / purchase / fixed asset source truth
- BI dashboard correcting GL / AP / AR / payment / bank reconciliation / asset truth
- approval decision directly posting or paying
- audit finding directly changing GL journal or bank reconciliation

# ============================================================
# 6. TRACK B COMPLETION STATE
# ============================================================

completion_state:
- Track B finance-side exact design indexed.
- Accounting / cash / fixed-assets / operational asset ownership fixed.
- Detailed source-to-finance handoffs fixed.
- Posting basis vs journal boundary fixed.
- Payment basis vs cash execution boundary fixed.
- Operational asset vs fixed asset accounting boundary fixed.
- BI projection boundary preserved.
- Track B can be treated as complete for boundary/exact-design layer.

# ============================================================
