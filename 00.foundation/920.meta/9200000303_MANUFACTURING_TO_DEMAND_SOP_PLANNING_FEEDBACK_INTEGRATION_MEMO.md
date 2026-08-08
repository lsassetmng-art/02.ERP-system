# ============================================================
# MANUFACTURING -> DEMAND / SOP / PLANNING
# FEEDBACK INTEGRATION MEMO EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- 15.manufacturing
- 06.demand-forecasting
- 07.sop-consensus
- 16.production-planning
- 60.business-intelligence

purpose:
Provide a concise cross-module integration memo so that execution actuals are
fed back to the correct module without ownership confusion.

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
- one source actual may lead to multiple downstream interpretations,
  but interpretations must be separated by module responsibility.

examples:
- late production completion
  - to 16 = replanning candidate
  - to 07 = consensus service-risk candidate if material
  - to 60 = variance reporting
- high scrap event
  - to 16 = feasibility/replan candidate
  - to 07 = capacity/inventory risk candidate if enterprise-significant
  - to 06 = learning input only if it affects future forecast calibration context
- shortage-constrained shipment
  - to 06 = learning input tagged as constrained outcome
  - to 60 = analytics
  - not direct market truth overwrite

# ============================================================
# 2. TARGET OWNERSHIP MATRIX
# ============================================================

| source fact from 15 | target meaning | owner after receipt |
|---|---|---|
| actual completion variance | executable replanning candidate | 16 |
| recurring execution instability | consensus review candidate | 07 |
| constrained fulfillment pattern | forecast learning candidate | 06 |
| plan vs actual KPI feed | analytical projection | 60 |
| realized accepted risk | issue / risk reconsideration | 07 |
| plant disruption evidence | capacity / schedule reconsideration | 16 |

# ============================================================
# 3. VERSIONING RULE
# ============================================================

versioning_rule:
- 15 emits immutable feedback events
- 16 reacts by new planning version if needed
- 07 reacts by new scenario / freeze version if needed
- 06 reacts by new forecast version if learning is adopted
- 60 reacts by refresh / new snapshot, never by source truth mutation

# ============================================================
# 4. INTERPRETATION RULE
# ============================================================

interpretation_rule:
- execution outcome is not automatically equal to market demand signal
- execution failure is not automatically equal to consensus failure
- target module must interpret feedback through its own workflow and canon

# ============================================================
# 5. COMPLETION STATE
# ============================================================

completion_state:
- execution feedback integration rule fixed at foundation layer
- upstream response ownership clarified
- misrouting risk reduced

# ============================================================
