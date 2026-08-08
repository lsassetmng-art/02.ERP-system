# ============================================================
# DEMAND FORECASTING POLICY AND BOUNDARY
# ============================================================

status: draft-exact-design
module: 06.demand-forecasting

## 1. Boundary policy
- 06 owns market demand forecast truth
- 07 owns consensus agreement truth
- 16 owns executable production planning truth
- 60 may analyze forecast truth but does not own it

## 2. Version policy
- frozen candidate versions are immutable snapshots
- material change after freeze requires new version
- superseded versions remain historically visible

## 3. Override policy
- all overrides must carry reason trace
- manual override does not destroy baseline history
- promotion and launch effects remain separable from generic override logic

## 4. Handoff policy
- S&OP handoff is payload-based
- accepted_by_sop does not transfer ownership of forecast canon
