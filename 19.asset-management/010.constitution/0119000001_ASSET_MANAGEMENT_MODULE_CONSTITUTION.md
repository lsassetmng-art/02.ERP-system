# ============================================================
# ASSET MANAGEMENT MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 19.asset-management
owner: Boss
prepared_by: Zero

## 1. Purpose
The Asset Management module governs operational asset and equipment lifecycle canon.
It is the canonical module for equipment register, maintenance plan, maintenance execution tracking, and utilization history.

## 2. Canonical scope
The Asset Management module owns:
- equipment register canon
- maintenance planning canon
- maintenance request canon
- utilization history canon
- downtime record canon
- maintenance completion canon

## 3. Non-scope
The Asset Management module does not own:
- fixed-asset accounting truth -> 33.fixed-assets
- manufacturing execution truth -> 15.manufacturing
- cost truth -> 18.costing
- accounting truth -> 30.accounting

## 4. Boundary rule
Asset Management owns operational equipment lifecycle and maintenance truth.
Fixed Assets owns financial asset accounting truth.
