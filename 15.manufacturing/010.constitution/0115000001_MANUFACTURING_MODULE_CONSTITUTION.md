# ============================================================
# MANUFACTURING MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 15.manufacturing
owner: Boss
prepared_by: Zero

## 1. Purpose
The Manufacturing module governs production execution canon after planning release.
It is the canonical module for production order creation, production order release,
material issue request, operation progress, output declaration, scrap capture, and manufacturing completion.

## 2. Canonical scope
The Manufacturing module owns:
- production order header canon
- production order operation canon
- operation progress canon
- material issue request canon
- production output declaration canon
- scrap / rework execution canon
- production completion canon
- execution exception canon

## 3. Non-scope
The Manufacturing module does not own:
- long-range and constrained production plan canon -> 16.production-planning
- inspection/release canon -> 17.quality
- costing truth -> 18.costing
- equipment maintenance canon -> 19.asset-management
- stock truth -> 12.inventory
- accounting truth -> 30.accounting

## 4. Lifecycle
Planned
-> Released
-> In Progress
-> Partially Completed
-> Completed
or
-> On Hold
or
-> Cancelled
or
-> Closed

## 5. Boundary rule
Planning decides what and when to execute.
Manufacturing owns actual execution truth.
Quality may block release or closure through quality decision references.
