# ============================================================
# DEMAND FORECASTING SECURITY AND ACCESS CONTROL
# ============================================================

status: draft-exact-design
module: 06.demand-forecasting

## 1. Access scopes
- demand_forecasting.read
- demand_forecasting.version.create
- demand_forecasting.adjust
- demand_forecasting.freeze
- demand_forecasting.send_to_sop
- demand_forecasting.admin.correct

## 2. Sensitive surfaces
- market demand assumptions
- promotion impact assumptions
- launch demand assumptions
- override rationale

## 3. Audit requirements
- forecast version creation logged
- manual adjustments logged
- freeze action logged
- S&OP candidate send logged
