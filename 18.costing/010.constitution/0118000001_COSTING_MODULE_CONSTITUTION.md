# ============================================================
# COSTING MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 18.costing
owner: Boss
prepared_by: Zero

## 1. Purpose
The Costing module governs cost truth.
It is the canonical module for standard cost, planned cost, actual cost accumulation, variance analysis, and cost rollup.

## 2. Canonical scope
The Costing module owns:
- standard cost canon
- actual cost accumulation canon
- cost variance canon
- cost rollup canon
- cost allocation rule canon
- cost analysis projection canon

## 3. Non-scope
The Costing module does not own:
- journal truth -> 30.accounting
- production execution truth -> 15.manufacturing
- stock quantity truth -> 12.inventory
- fixed asset accounting truth -> 33.fixed-assets

## 4. Boundary rule
Costing owns economic/cost truth.
Accounting owns financial booking truth.
