# ============================================================
# PRODUCTION PLANNING MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 16.production-planning
owner: Boss
prepared_by: Zero

## 1. Purpose
The Production Planning module governs manufacturing planning truth before execution.
It is the canonical module for MRP, CRP, constrained/unconstrained supply planning, and schedule release decisions.

## 2. Canonical scope
The Production Planning module owns:
- demand/supply plan canon
- MRP proposal canon
- CRP load plan canon
- detailed scheduling plan canon
- production release recommendation canon

## 3. Non-scope
The Production Planning module does not own:
- production execution canon -> 15.manufacturing
- inspection/release canon -> 17.quality
- cost truth -> 18.costing
- maintenance canon -> 19.asset-management

## 4. Submodule split
- 01.mrp
- 02.crp
- 03.scheduling

## 5. Boundary rule
Planning owns decision truth before execution release.
Manufacturing owns actual execution after release.
