# ============================================================
# DEMAND FORECASTING MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 06.demand-forecasting

## 1. Logical components
1. Forecast Version Service
2. Baseline Forecast Generation Service
3. Manual Adjustment / Override Service
4. Promotion Impact Service
5. New Product Forecast Service
6. Forecast Comparison Projection Service
7. S&OP Candidate Bridge Service

## 2. Main aggregates
- demand_forecast_version
- demand_forecast_line
- demand_forecast_adjustment
- demand_forecast_assumption
- demand_promotion_impact
- demand_new_product_forecast
- demand_sop_candidate

## 3. Inbound dependencies
From 52.master-data:
- item reference
- store reference
- region reference
- channel reference
- calendar reference
- promotion reference category if maintained as master data

From commercial domains:
- historical sales/order reference for analytical input only
- new product launch reference if available
Historical source data remains outside 06 canon.

From 00.foundation / CommonOS:
- list/detail/form/compare/search presentation base
- sync presentation base

## 4. Outbound surfaces
To 07.sop-consensus:
- frozen forecast candidate payload
- forecast assumptions summary
- demand risk / upside note

To 60.business-intelligence:
- demand forecast analytical projection source

## 5. User surfaces
- Forecast Version List
- Forecast Detail
- Forecast Adjustment Screen
- Forecast Comparison Screen
- Promotion Impact Screen
- New Product Forecast Screen
- S&OP Candidate Export Screen

## 6. Architecture rule
- command side updates forecast canon
- query side serves compare/search/list/detail projections
- historical source sales/order data is consumed as reference, not absorbed as canon
- forecast candidate handoff to S&OP is payload/event based
- forecast overrides must remain auditable

## 7. CommonOS boundary
UI shell, table, compare view, form, dialog, queue UI use Foundation.
Forecast logic, version truth, adjustment trace, and candidate handoff canon remain inside 06.demand-forecasting.
