# ============================================================
# ERP FINANCE / CASH / FIXED ASSETS / ASSET MANAGEMENT
# BOUNDARY MEMO EXACT
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
- 32.project-accounting
- 42.payroll
- 31.management-accounting
- 60.business-intelligence

purpose:
Fix the finance-side boundary between accounting posting, AP/AR/subledger,
cash payment execution, bank reconciliation, fixed asset accounting,
operational asset management, and BI projection.

# ============================================================
# 1. MODULE POSITIONS
# ============================================================

## 1.1 30.accounting
canonical_role:
- statutory accounting / GL / subledger / posting / close truth

owns_truth:
- general ledger journal
- posting batch
- accounting document
- AP subledger accounting entry
- AR subledger accounting entry
- accrual / adjustment journal
- trial balance
- accounting close
- accounting correction / reversal
- accepted posting basis intake from source modules

does_not_own:
- invoice source truth
- purchase order truth
- payroll calculation truth
- cost rollup truth
- cash execution truth
- bank statement truth
- operational asset maintenance truth
- BI dashboard projection truth

## 1.2 34.cash-management
canonical_role:
- cash payment / cash receipt / bank movement / bank reconciliation truth

owns_truth:
- payment execution
- payment batch
- bank transfer execution
- cash receipt matching
- bank statement intake
- bank reconciliation
- cash position
- cash movement event
- payment rejection / reversal / cancellation
- cash forecast where cash-side

does_not_own:
- invoice truth
- payroll calculation truth
- GL journal truth
- purchase order truth
- fixed asset depreciation truth
- BI projection truth

## 1.3 33.fixed-assets
canonical_role:
- fixed asset accounting / capitalization / depreciation / impairment / disposal truth

owns_truth:
- fixed asset register for accounting
- asset capitalization
- depreciation area / depreciation run
- impairment
- asset transfer for accounting
- asset disposal
- asset retirement
- fixed-asset-to-accounting posting basis
- fixed asset close package

does_not_own:
- operational maintenance schedule truth
- physical utilization record truth
- cash payment execution truth
- GL journal truth
- BI projection truth

## 1.4 19.asset-management
canonical_role:
- operational asset register / maintenance / utilization truth

owns_truth:
- operational asset record
- asset assignment / location / custody
- maintenance plan
- maintenance work order
- maintenance execution
- asset utilization
- asset condition
- asset downtime
- operational asset lifecycle event
- asset-to-fixed-asset capitalization candidate basis

does_not_own:
- depreciation truth
- fixed asset accounting register truth
- GL journal truth
- cash payment truth
- BI projection truth

# ============================================================
# 2. CANONICAL FINANCE-SIDE FLOW
# ============================================================

posting_flow:
- source modules
- -> posting basis
- -> 30.accounting posting intake
- -> GL / subledger / accounting document
- -> accounting close
- -> BI snapshot

cash_flow:
- invoice / payroll / purchase / accounting basis
- -> 34.cash-management payment or receipt execution
- -> bank statement / bank movement
- -> reconciliation
- -> accounting feedback / posting basis where applicable
- -> BI snapshot

fixed_asset_flow:
- purchase / project / asset-management / costing basis
- -> 33.fixed-assets capitalization
- -> depreciation / impairment / transfer / disposal
- -> fixed asset posting basis
- -> 30.accounting GL journal
- -> BI snapshot

operational_asset_flow:
- asset acquisition / assignment / maintenance / utilization
- -> 19.asset-management operational truth
- -> capitalization candidate if asset qualifies
- -> 33.fixed-assets accounting truth if capitalized
- -> 30.accounting posting where needed

# ============================================================
# 3. OWNERSHIP MATRIX
# ============================================================

| concept | owner_module | note |
|---|---|---|
| invoice | 05.billing | billing truth |
| supplier claim / purchase return | 10.purchase | supplier commercial truth |
| payroll close package | 42.payroll | payroll truth |
| cost rollup / variance | 18.costing | cost truth |
| project WIP/capitalization basis | 32.project-accounting | project financial truth |
| posting basis | source module | accounting input basis |
| GL journal | 30.accounting | statutory accounting truth |
| AP / AR accounting entry | 30.accounting | accounting truth |
| payment execution | 34.cash-management | cash truth |
| bank statement / reconciliation | 34.cash-management | cash/bank truth |
| fixed asset capitalization | 33.fixed-assets | fixed asset accounting truth |
| depreciation run | 33.fixed-assets | fixed asset accounting truth |
| asset maintenance work order | 19.asset-management | operational asset truth |
| asset utilization | 19.asset-management | operational asset truth |
| dashboard projection | 60.business-intelligence | analytical projection |

# ============================================================
# 4. CORE BOUNDARY RULES
# ============================================================

posting_basis_rule:
- Source modules emit posting basis.
- Posting basis is not GL journal.
- 30.accounting accepts/rejects posting basis and owns accounting posting truth.

cash_basis_rule:
- Source modules emit payment/receipt basis.
- Payment/receipt basis is not bank execution.
- 34.cash-management owns cash execution and bank reconciliation.

fixed_asset_rule:
- 33.fixed-assets owns accounting asset lifecycle.
- 19.asset-management owns operational asset lifecycle.
- Capitalization candidate is not fixed asset accounting truth until accepted by 33.

management_accounting_rule:
- 31.management-accounting consumes finance outputs for internal management view.
- 31 does not own statutory accounting, cash execution, or fixed asset accounting truth.

BI_rule:
- 60.business-intelligence consumes snapshots only.
- BI does not post, pay, reconcile, capitalize, depreciate, or dispose assets.

# ============================================================
# 5. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- billing invoice directly becoming GL journal
- payroll posting basis directly becoming GL journal
- costing posting basis directly becoming GL journal
- purchase claim directly posting accounting journal
- payment basis directly becoming bank transfer execution
- payslip issue treated as salary payment completion
- bank statement line treated as GL journal without accounting workflow
- operational asset record treated as fixed asset accounting register without capitalization workflow
- maintenance work order changing depreciation directly
- fixed asset depreciation changing operational asset condition
- BI dashboard correcting GL / payment / bank reconciliation / fixed asset register
- approval decision directly posting accounting entry
- audit finding directly changing GL journal or bank reconciliation

# ============================================================
# 6. DECISION TEST
# ============================================================

decision_tests:
- If it says what should be posted to statutory ledger, source module emits basis and 30 posts.
- If it says what was posted to ledger, 30.accounting owns it.
- If it says what cash/bank movement was executed or reconciled, 34.cash-management owns it.
- If it says what asset is capitalized/depreciated/disposed for accounting, 33.fixed-assets owns it.
- If it says how the asset is maintained/used/located operationally, 19.asset-management owns it.
- If it says how it is displayed or summarized, 60.business-intelligence owns projection only.

# ============================================================
# 7. COMPLETION STATE
# ============================================================

completion_state:
- finance-side boundary fixed
- accounting vs cash vs fixed asset vs operational asset separated
- posting/payment/capitalization shortcuts forbidden
- Track B foundation memo created

# ============================================================
