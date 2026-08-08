# ============================================================
# ACCOUNTING MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 30.accounting
owner: Boss
prepared_by: Zero

## 1. Purpose
The Accounting module governs financial accounting truth.
It is the canonical module for journal entry, receivable/payable ledger, settlement truth,
period close, tax posting basis, and accounting posting control.

## 2. Canonical scope
The Accounting module owns:
- journal entry canon
- journal header/line truth
- AR/AP ledger truth
- settlement truth
- posting period control truth
- close status truth
- accounting error / suspense handling canon

## 3. Non-scope
The Accounting module does not own:
- invoice canon -> 05.billing
- purchase order canon -> 10.purchase
- cost truth -> 18.costing
- fixed asset accounting canon -> 33.fixed-assets
- treasury/cash execution canon -> 34.cash-management
- managerial profitability canon -> 31.management-accounting

## 4. Lifecycle
Draft Posting
-> Validated
-> Posted
-> Settled / Reconciled
-> Closed
or
-> Reversed / Corrected

## 5. Boundary rule
Accounting owns financial truth.
Other modules provide reference payloads only.
