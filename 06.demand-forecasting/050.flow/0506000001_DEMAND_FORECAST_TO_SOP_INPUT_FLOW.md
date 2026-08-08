# ============================================================
# DEMAND FORECAST TO SOP INPUT FLOW
# ============================================================

status: draft-exact-design
module: 06.demand-forecasting

## 1. Baseline generation flow
1. baseline forecast version is created
2. baseline quantities are loaded from analytical/reference signals
3. forecast assumptions are attached
4. baseline becomes review candidate

## 2. Adjustment flow
1. planner reviews baseline
2. manual overrides are applied where needed
3. promotion impacts are added
4. new product forecast lines are added
5. adjusted forecast becomes review candidate

## 3. Freeze flow
1. review candidate is approved for freeze
2. version is frozen as forecast candidate
3. frozen candidate becomes immutable snapshot

## 4. S&OP candidate flow
1. frozen forecast candidate is packaged
2. payload is emitted to 07.sop-consensus
3. send result is tracked
4. accepted_by_sop updates candidate status only; 06 remains market forecast truth

## 5. Exception flow
- invalid scope/dimension combinations are rejected
- failed S&OP handoff is retryable
- supersession requires new version rather than destructive overwrite
