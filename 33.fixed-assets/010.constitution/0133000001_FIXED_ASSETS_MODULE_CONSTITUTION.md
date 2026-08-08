# ============================================================
# FIXED ASSETS MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 33.fixed-assets
owner: Boss
prepared_by: Zero

## 1. Purpose
The Fixed Assets module governs financial fixed-asset accounting canon.
It is the canonical module for capitalization, depreciation basis, depreciation schedule, disposal, impairment reference, and asset-accounting close.

## 2. Canonical scope
The module owns:
- asset-accounting register
- capitalization canon
- depreciation schedule canon
- disposal canon
- impairment / revaluation reference canon
- fixed-asset close status canon

## 3. Non-scope
It does not own:
- operational maintenance truth -> 19.asset-management
- general journal truth -> 30.accounting
- treasury truth -> 34.cash-management
