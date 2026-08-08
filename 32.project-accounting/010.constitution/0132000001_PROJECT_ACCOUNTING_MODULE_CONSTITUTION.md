# ============================================================
# PROJECT ACCOUNTING MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 32.project-accounting
owner: Boss
prepared_by: Zero

## 1. Purpose
The Project Accounting module governs project financial control canon.
It is the canonical module for project budget, project cost/revenue attribution, WIP/project financial status, and project close control.

## 2. Canonical scope
The module owns:
- project budget canon
- project actual attribution canon
- project WIP status canon
- project revenue/cost performance canon
- project financial close status canon

## 3. Non-scope
It does not own:
- general ledger truth -> 30.accounting
- managerial allocation truth -> 31.management-accounting
- costing truth -> 18.costing
