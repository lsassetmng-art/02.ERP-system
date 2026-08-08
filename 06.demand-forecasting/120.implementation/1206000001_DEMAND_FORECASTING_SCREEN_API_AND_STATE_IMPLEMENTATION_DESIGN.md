# ============================================================
# DEMAND FORECASTING SCREEN API AND STATE IMPLEMENTATION DESIGN
# ============================================================

status: draft-exact-design
module: 06.demand-forecasting

## 1. Screens
- DemandForecastVersionListScreen
- DemandForecastDetailScreen
- DemandForecastAdjustmentScreen
- DemandForecastComparisonScreen
- PromotionImpactScreen
- NewProductForecastScreen
- SopCandidateSendScreen

## 2. Screen states
- loading
- loaded
- empty
- validation_error
- sync_pending
- review_candidate
- frozen_candidate
- handoff_failed
- superseded

## 3. CommonOS use
- list / table / compare / form / dialog / search / filter / queue status
- dense ERP input variant may be used where needed

## 4. API integration points
- create forecast version
- apply adjustment
- freeze version
- send to S&OP
- list / detail / compare / search

## 5. Exact frontend modules
- presenter/version-list
- presenter/forecast-detail
- presenter/adjustment-form
- presenter/comparison-view
- presenter/promotion-impact
- mapper/forecast-summary
- mapper/forecast-detail
- bridge/demand-forecasting-api
- sync/forecast-command-queue
