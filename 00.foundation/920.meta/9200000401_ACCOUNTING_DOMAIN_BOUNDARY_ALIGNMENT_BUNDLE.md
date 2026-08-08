# ============================================================
# ACCOUNTING DOMAIN BOUNDARY ALIGNMENT BUNDLE
# ============================================================

status: generated
scope:
- 30.accounting
- 31.management-accounting
- 32.project-accounting
- 33.fixed-assets
- 34.cash-management

owner: Boss
prepared_by: Zero

## 1. Canonical ownership summary
- 30.accounting owns financial accounting truth, journal truth, receivable/payable ledger truth, settlement truth, and period close truth
- 31.management-accounting owns internal profitability, cost center / segment / managerial allocation canon
- 32.project-accounting owns project financial tracking canon, project budget / project WIP / project revenue-cost attribution canon
- 33.fixed-assets owns capitalization, depreciation, disposal, and asset-accounting canon
- 34.cash-management owns bank account position, cash forecast, cash movement planning, and treasury execution canon

## 2. Explicit non-ownership
- 30.accounting does not own internal managerial profitability canon
- 31.management-accounting does not own journal truth
- 32.project-accounting does not own general ledger truth
- 33.fixed-assets does not own operational maintenance canon
- 34.cash-management does not own general ledger truth

## 3. Handoff chain
Billing / Purchase / Costing / Payroll / Fixed Assets / Cash references
-> Accounting journal / subledger truth
-> Management / Project views and managerial allocation truth
-> Cash planning / treasury execution reference loop

## 4. Cross-domain boundary
- 05.billing emits invoice/accounting references
- 10.purchase emits supplier-side accounting references
- 18.costing emits costing/accounting references
- 19.asset-management emits operational asset references
- 42.payroll emits payroll accounting references

## 5. Design rule
Every handoff is payload/event based.
No module directly mutates another module's canon.
