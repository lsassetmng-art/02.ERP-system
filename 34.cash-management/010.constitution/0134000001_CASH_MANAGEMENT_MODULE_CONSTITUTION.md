# ============================================================
# CASH MANAGEMENT MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 34.cash-management
owner: Boss
prepared_by: Zero

## 1. Purpose
The Cash Management module governs treasury and cash execution canon.
It is the canonical module for bank account position, cash forecast, cash transfer plan, payment execution tracking, and reconciliation reference control.

## 2. Canonical scope
The module owns:
- bank account position canon
- cash forecast canon
- transfer plan canon
- payment execution tracking canon
- bank reconciliation reference control canon

## 3. Non-scope
It does not own:
- journal truth -> 30.accounting
- AR/AP truth -> 30.accounting
- invoice canon -> 05.billing
- purchase order canon -> 10.purchase
