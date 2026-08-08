# ============================================================
# BUSINESS INTELLIGENCE MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 60.business-intelligence
owner: Boss
prepared_by: Zero

## 1. Purpose
The Business Intelligence module governs analytical projection truth across ERP.
It is the canonical module for KPI definition, dashboard projection, cross-domain analytics snapshot,
executive summary dataset, and drill-down linkage.

## 2. Canonical scope
The module owns:
- KPI definition canon
- dashboard projection canon
- analytical dataset snapshot canon
- executive summary projection canon
- drill-down linkage canon
- forecast / sales / supply / manufacturing / accounting / HR analytical views
- BI refresh execution history

## 3. Non-scope
The module does not own:
- order canon -> 04.order-management
- billing canon -> 05.billing
- demand forecast canon -> 06.demand-forecasting
- S&OP consensus canon -> 07.sop-consensus
- inventory canon -> 12.inventory
- manufacturing canon -> 15.manufacturing
- accounting canon -> 30.accounting
- HR / labor / payroll canon -> 40/41/42
- master reference canon -> 52.master-data

## 4. Core business intent
The module must allow the organization to:
- define enterprise KPIs consistently
- build cross-domain dashboards without copying business ownership
- generate reproducible analytical snapshots
- support executive review and operational drill-down
- keep analytical truth traceable to source references

## 5. Canonical lifecycle
KPI Defined
-> Dataset Refreshed
-> Dashboard Published
-> Snapshot Archived
-> Superseded

## 6. Boundary rule
BI owns analytical projection truth only.
Source modules remain owners of business canon.

## 7. CommonOS usage
BI uses shared UI for:
- dashboard list
- dashboard detail
- KPI management
- filter / compare / drill-down
- refresh status and queue presentation
The business canon remains outside 60.business-intelligence.
