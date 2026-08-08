# ============================================================
# FORECAST TO CONSENSUS TO PRODUCTION PLAN FLOW
# ============================================================

status: draft-exact-design
module: 07.sop-consensus

## 1. Candidate intake flow
1. frozen forecast candidate arrives from 06.demand-forecasting
2. candidate demand is loaded into consensus draft
3. initial supply, capacity, and inventory references are attached

## 2. Scenario review flow
1. planners review demand candidate
2. supply scenarios are compared
3. capacity constraints are reviewed
4. inventory policy impacts are examined
5. unresolved issues are logged

## 3. Consensus draft flow
1. agreed demand is set
2. agreed supply is set
3. inventory and capacity assumptions are fixed
4. consensus draft becomes executive review candidate

## 4. Executive freeze flow
1. executive review is performed
2. freeze decision is recorded
3. version becomes approved_freeze
4. approved_freeze becomes immutable snapshot

## 5. Production planning handoff flow
1. approved consensus plan is packaged
2. payload is emitted to 16.production-planning
3. send result is tracked
4. accepted_by_production_planning updates handoff status only

## 6. Exception flow
- unresolved issue remains open but accepted_risk may allow freeze
- failed production-planning handoff is retryable
- supersession requires new version rather than destructive overwrite
