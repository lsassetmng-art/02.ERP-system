# ============================================================
# MASTER DATA MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 52.master-data
owner: Boss
prepared_by: Zero

## 1. Purpose
The Master Data module governs shared reference truth across ERP.
It is the canonical module for common reference identity and shared reference maintenance
used across commercial, supply, manufacturing, accounting, and HR bundles.

## 2. Canonical scope
The module owns:
- customer reference canon
- supplier reference canon
- item reference canon
- org/department reference canon
- warehouse/location reference canon
- account/tax/payment-term reference canon
- employee/approver shared reference identifiers where applicable
- shared classification/reference lookup canon

## 3. Non-scope
It does not own:
- transactional business canon
- approval decision canon -> 50.approval
- audit finding canon -> 51.audit
- invoice/order/stock/manufacturing/accounting/payroll truth

## 4. Lifecycle
Draft Reference
-> Active
-> Updated
-> Deprecated
-> Archived

## 5. Boundary rule
Master Data owns shared reference identity and shared lookup truth.
Operational modules own business transaction truth that references these identities.
