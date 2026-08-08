# ============================================================
# SOP CONSENSUS INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 07.sop-consensus

## 1. API surfaces

### 1.1 Create consensus version from forecast candidate
POST /sop-consensus/versions

request example:
{
  "source_module": "06.demand-forecasting",
  "demand_forecast_version_id": "uuid",
  "planning_horizon_from": "2026-05",
  "planning_horizon_to": "2026-07",
  "scenario_basis": "monthly_cycle"
}

response example:
{
  "sop_consensus_version_id": "uuid",
  "consensus_version_code": "SOP-2026-000001",
  "version_status": "candidate_input"
}

### 1.2 Update agreed quantities
POST /sop-consensus/versions/{sop_consensus_version_id}/agree

request example:
{
  "item_id": "uuid",
  "period_id": "2026-05",
  "agreed_demand_quantity": 100,
  "agreed_supply_quantity": 95,
  "capacity_risk_note": "week2 overload accepted"
}

### 1.3 Freeze consensus
POST /sop-consensus/versions/{sop_consensus_version_id}/freeze

response example:
{
  "sop_consensus_version_id": "uuid",
  "version_status": "approved_freeze",
  "approved_freeze_at": "2026-04-23T10:00:00+09:00"
}

### 1.4 Send to production planning
POST /sop-consensus/versions/{sop_consensus_version_id}/send-to-production-planning

response example:
{
  "sop_production_planning_handoff_id": "uuid",
  "handoff_status": "sent"
}

## 2. Production planning handoff payload
{
  "source_module": "07.sop-consensus",
  "sop_consensus_version_id": "uuid",
  "consensus_version_code": "SOP-2026-000001",
  "planning_horizon_from": "2026-05",
  "planning_horizon_to": "2026-07",
  "demand_lines": [
    {
      "item_id": "uuid",
      "period_id": "2026-05",
      "agreed_quantity": 100
    }
  ],
  "supply_lines": [
    {
      "item_id": "uuid",
      "period_id": "2026-05",
      "agreed_supply_quantity": 95
    }
  ],
  "inventory_policy": [
    {
      "policy_scope": "item",
      "item_id": "uuid",
      "safety_stock_policy": "normal"
    }
  ],
  "capacity_consensus": [
    {
      "work_center_id": "uuid",
      "period_id": "2026-05",
      "agreed_capacity": 480
    }
  ],
  "issue_summary": [
    {
      "issue_type": "capacity",
      "issue_title": "week2 overload"
    }
  ]
}

## 3. Integration rule
- 07 emits agreed consensus payloads
- 16 consumes them and creates executable planning truth
- 07 does not overwrite 16 truth
- 06 truth remains independent and historically visible
