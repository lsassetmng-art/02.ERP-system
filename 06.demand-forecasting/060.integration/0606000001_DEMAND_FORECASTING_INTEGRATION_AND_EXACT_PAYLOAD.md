# ============================================================
# DEMAND FORECASTING INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 06.demand-forecasting

## 1. API surfaces

### 1.1 Create forecast version
POST /demand-forecasting/versions

request example:
{
  "forecast_scope": "store_item_month",
  "forecast_period_from": "2026-05",
  "forecast_period_to": "2026-07",
  "baseline_source_type": "historical_plus_rules"
}

response example:
{
  "demand_forecast_version_id": "uuid",
  "forecast_version_code": "DF-2026-000001",
  "version_status": "baseline"
}

### 1.2 Apply adjustment
POST /demand-forecasting/versions/{demand_forecast_version_id}/adjustments

request example:
{
  "demand_forecast_line_id": "uuid",
  "adjustment_type": "manual_override",
  "adjustment_reason_code": "store_manager_feedback",
  "adjustment_quantity": 15,
  "adjustment_note": "expected local event uplift"
}

### 1.3 Freeze candidate
POST /demand-forecasting/versions/{demand_forecast_version_id}/freeze

response example:
{
  "demand_forecast_version_id": "uuid",
  "version_status": "frozen_candidate",
  "frozen_at": "2026-04-23T09:00:00+09:00"
}

### 1.4 Send to S&OP
POST /demand-forecasting/versions/{demand_forecast_version_id}/send-to-sop

response example:
{
  "demand_sop_candidate_id": "uuid",
  "candidate_status": "sent"
}

## 2. S&OP candidate payload
{
  "source_module": "06.demand-forecasting",
  "demand_forecast_version_id": "uuid",
  "forecast_version_code": "DF-2026-000001",
  "forecast_scope": "store_item_month",
  "period_from": "2026-05",
  "period_to": "2026-07",
  "lines": [
    {
      "item_id": "uuid",
      "store_id": "uuid",
      "region_id": null,
      "channel_id": null,
      "period_id": "2026-05",
      "adjusted_quantity": 120,
      "forecast_confidence": "medium"
    }
  ],
  "assumption_summary": [
    {
      "assumption_type": "promotion",
      "assumption_title": "golden_week_campaign"
    }
  ]
}

## 3. Integration rule
- 06 emits market demand candidate payloads
- 07 consumes them and creates consensus truth
- 06 does not overwrite S&OP truth
- 16 does not overwrite 06 truth
