# ============================================================
# BUSINESS INTELLIGENCE MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 60.business-intelligence

## 1. Logical components
1. KPI Definition Service
2. Dataset Snapshot Service
3. Dashboard Projection Service
4. Executive Summary Service
5. Cross-Domain Drill-Down Service
6. Refresh Orchestration Service
7. Access-Safe Presentation Service

## 2. Main aggregates
- bi_kpi_definition
- bi_dataset_snapshot
- bi_dashboard_view
- bi_executive_summary
- bi_drilldown_link
- bi_refresh_run
- bi_filter_profile

## 3. Inbound dependencies
From all source ERP modules:
- source references and source projections for analytical use
- refresh-safe extracted/derived metrics
- business canon stays in source modules

From 52.master-data:
- shared reference lookups and display metadata

From 00.foundation / CommonOS:
- dashboard/list/filter/detail/search presentation base
- sync/refresh status presentation base

## 4. Outbound surfaces
To users:
- executive dashboards
- operational dashboards
- drill-down entry points
- KPI scorecards

To governance/reporting:
- analytical snapshot exports
- refresh status evidence

## 5. User surfaces
- Dashboard Catalog
- Dashboard Detail
- KPI Definition Screen
- Executive Summary Screen
- Refresh Run Monitor
- Filter Profile Screen
- Drill-Down Navigator

## 6. Architecture rule
- BI stores analytical projection truth, not operational transaction truth
- drill-down links reference source modules rather than copying source canon
- dataset refresh must be reproducible and auditable
- refresh orchestration is append-oriented

## 7. CommonOS boundary
UI shell, chart container, filter panel, dashboard widgets, queue/refresh UI use Foundation.
KPI definitions, dataset snapshots, dashboard projections, and drill-down link canon remain inside 60.business-intelligence.
