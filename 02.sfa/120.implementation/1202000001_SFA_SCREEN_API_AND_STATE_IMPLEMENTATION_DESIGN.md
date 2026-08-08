# ============================================================
# SFA SCREEN API AND STATE IMPLEMENTATION DESIGN
# ============================================================

status: draft-exact-design
module: 02.sfa

## 1. Screens
- SfaLeadListScreen
- SfaLeadDetailScreen
- SfaOpportunityListScreen
- SfaOpportunityKanbanScreen
- SfaOpportunityDetailScreen
- SfaActivityTimelineScreen
- SfaNextActionQueueScreen
- SfaForecastDashboardScreen
- SfaQuoteRequestScreen

## 2. Screen states
- loading
- loaded
- empty
- validation_error
- sync_pending
- overdue_action
- quote_request_failed
- closed_won
- closed_lost

## 3. CommonOS use
- list / kanban / form / dialog / search / filter / queue status / toast
- dense ERP input variant may be used where needed

## 4. API integration points
- create lead
- convert lead
- update opportunity stage
- record activity
- manage next action
- request quote
- list / detail / search / dashboard

## 5. Exact frontend modules
- presenter/lead-list
- presenter/opportunity-kanban
- presenter/opportunity-detail
- presenter/activity-timeline
- presenter/forecast-dashboard
- mapper/opportunity-summary
- bridge/sfa-api
- sync/sfa-command-queue
