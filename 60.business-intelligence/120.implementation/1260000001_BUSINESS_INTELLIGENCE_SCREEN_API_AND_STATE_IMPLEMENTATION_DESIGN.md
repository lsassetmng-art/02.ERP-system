# ============================================================
# BUSINESS INTELLIGENCE SCREEN API AND STATE IMPLEMENTATION DESIGN
# ============================================================

status: draft-exact-design
module: 60.business-intelligence

## 1. Screens
- DashboardCatalogScreen
- DashboardDetailScreen
- KpiDefinitionScreen
- ExecutiveSummaryScreen
- RefreshRunMonitorScreen
- FilterProfileScreen
- DrillDownNavigatorScreen

## 2. Screen states
- loading
- loaded
- empty
- validation_error
- sync_pending
- refresh_running
- refresh_failed
- published
- retired

## 3. CommonOS use
- dashboard shell / widget containers / filter panels / search / queue status
- dense ERP input variant may be used where needed for admin surfaces

## 4. API integration points
- create KPI
- trigger refresh
- publish dashboard
- list / detail / search / refresh monitor

## 5. Exact frontend modules
- presenter/dashboard-catalog
- presenter/dashboard-detail
- presenter/kpi-form
- presenter/executive-summary
- presenter/refresh-monitor
- mapper/dashboard-summary
- mapper/kpi-detail
- bridge/business-intelligence-api
- sync/bi-command-queue
