# ============================================================
# DEMAND FORECASTING MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 06.demand-forecasting
owner: Boss
prepared_by: Zero

## 1. Purpose
The Demand Forecasting module governs market-side demand forecast truth before S&OP agreement
and before executable production planning.
It is the canonical module for sales demand forecast, store demand forecast, channel demand forecast,
promotion impact forecast, and new product demand forecast.

## 2. Canonical scope
The module owns:
- sales demand forecast canon
- store demand forecast canon
- regional demand forecast canon
- channel demand forecast canon
- promotion uplift / event effect forecast canon
- new product launch demand forecast canon
- demand forecast version history
- forecast assumption notes and override trace

## 3. Non-scope
The module does not own:
- consensus demand/supply agreement canon -> 07.sop-consensus
- executable manufacturing planning canon -> 16.production-planning
- actual customer order canon -> 04.order-management
- inventory truth -> 12.inventory
- BI dashboard truth -> 60.business-intelligence
- accounting truth -> 30.accounting

## 4. Core business intent
The module must allow the business to:
- forecast market demand before operational commitment
- compare baseline and adjusted forecast versions
- reflect promotions, seasonality, channels, and store effects
- create auditable override history
- provide candidate demand input to S&OP consensus

## 5. Canonical lifecycle
Baseline Forecast
-> Adjusted Forecast
-> Review Candidate
-> Frozen Forecast Candidate
-> Sent To S&OP
-> Superseded / Archived

## 6. Boundary rule
Demand Forecasting owns market demand truth.
S&OP owns agreed plan truth.
Production Planning owns executable planning truth.

## 7. CommonOS usage
Demand Forecasting uses shared UI for:
- forecast list
- forecast detail
- forecast adjustment form
- comparison view
- search / filter
- offline queue presentation
The business canon remains inside 06.demand-forecasting.
