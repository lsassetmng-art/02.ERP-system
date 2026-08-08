# ============================================================
# QUALITY MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 17.quality
owner: Boss
prepared_by: Zero

## 1. Purpose
The Quality module governs inspection and quality decision canon.
It is the canonical module for inspection lot, inspection result, nonconformance, CAPA, and quality release/hold decisions.

## 2. Canonical scope
The Quality module owns:
- inspection lot
- inspection result
- quality release / hold decision
- NCR canon
- CAPA canon
- quality disposition canon

## 3. Non-scope
The Quality module does not own:
- production execution canon -> 15.manufacturing
- stock truth -> 12.inventory
- costing truth -> 18.costing
- audit truth -> 51.audit

## 4. Boundary rule
Quality owns quality judgment truth.
Execution modules consume release/hold references only.
