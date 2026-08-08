# ============================================================
# BUSINESS INTELLIGENCE INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 60.business-intelligence

## 1. API surfaces

### 1.1 Create KPI definition
POST /business-intelligence/kpis

request example:
{
  "kpi_code": "sales_growth_rate",
  "kpi_name": "Sales Growth Rate",
  "kpi_category": "commercial",
  "display_unit": "percent",
  "owner_module_group": "commercial"
}

response example:
{
  "bi_kpi_definition_id": "uuid",
  "active_status": "active"
}

### 1.2 Trigger dataset refresh
POST /business-intelligence/datasets/refresh

request example:
{
  "dataset_name": "erp_executive_kpi_daily",
  "refresh_scope": "full"
}

response example:
{
  "bi_refresh_run_id": "uuid",
  "refresh_status": "pending"
}

### 1.3 Publish dashboard
POST /business-intelligence/dashboards/{bi_dashboard_view_id}/publish

response example:
{
  "bi_dashboard_view_id": "uuid",
  "publish_status": "published"
}

## 2. Dataset refresh request example
{
  "dataset_name": "supply_chain_control_tower_daily",
  "refresh_scope": "incremental",
  "source_modules": [
    "06.demand-forecasting",
    "07.sop-consensus",
    "12.inventory",
    "13.warehouse",
    "14.logistics"
  ]
}

## 3. Drill-down link example
{
  "dashboard_code": "commercial_kpi_exec",
  "source_module": "04.order-management",
  "source_route_type": "detail",
  "source_reference_hint": "sales_order_number"
}

## 4. Integration rule
- BI consumes source references and source-safe projections
- BI does not become operational canon owner
- drill-down points back to source modules wherever possible
