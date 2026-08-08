# ============================================================
# ACCOUNTING MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 30.accounting

## 1. Logical components
1. Journal Posting Service
2. Receivable / Payable Ledger Service
3. Settlement Service
4. Period Close Service
5. Posting Validation / Suspense Service
6. Search / Trial Balance Projection Service

## 2. Main aggregates
- acc_journal_entry
- acc_journal_line
- acc_receivable_ledger
- acc_payable_ledger
- acc_settlement
- acc_period_control
- acc_suspense_record

## 3. Inbound dependencies
From 05.billing:
- invoice accounting reference

From 10.purchase:
- supplier accounting reference

From 18.costing:
- variance / cost accounting reference

From 33.fixed-assets:
- capitalization / depreciation / disposal reference

From 42.payroll:
- payroll accounting reference

## 4. Outbound surfaces
To 31.management-accounting:
- managerial source reference
To 32.project-accounting:
- project-attributable journal reference
To 34.cash-management:
- settlement / due reference
To reporting:
- trial balance / ledger projection

## 5. Architecture rule
Accounting creates financial truth.
Inbound documents remain source references, not accounting canon.
