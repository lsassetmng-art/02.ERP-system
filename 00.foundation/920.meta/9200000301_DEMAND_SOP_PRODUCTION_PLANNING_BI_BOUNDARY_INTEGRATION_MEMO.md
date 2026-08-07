# ============================================================
# ERP DEMAND / S&OP / PRODUCTION PLANNING / BI
# UPPER BOUNDARY INTEGRATION MEMO EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- 06.demand-forecasting
- 07.sop-consensus
- 16.production-planning
- 60.business-intelligence

purpose:
Fix the upper boundary across market demand forecasting, S&OP consensus,
production planning, and BI analytical projection so that truth ownership,
freeze behavior, handoff contracts, and reporting boundaries do not drift.

# ============================================================
# 1. CANONICAL PRINCIPLES
# ============================================================

principles:
- additive_only
- existing module design remains valid
- this memo does not replace module exact design
- this memo only fixes cross-module upper boundaries
- truth must stay in business modules, not in BI
- CommonOS may provide presentation, not business canon
- queue presentation may be CommonOS
- queue meaning must stay in each ERP module

non_goals:
- no full ERP restructuring
- no source truth move from one module to another
- no BI ownership expansion into business canon
- no merge of 06 / 07 / 16 responsibilities

# ============================================================
# 2. POSITION OF EACH MODULE
# ============================================================

## 2.1 06.demand-forecasting
canonical_role:
- market-side demand forecast truth

owns_truth:
- sales forecast
- store forecast
- channel forecast
- region forecast
- sku / product family demand forecast
- promotion impact forecast
- launch / new product forecast
- statistical baseline forecast
- planner override trace
- forecast version lineage
- forecast assumptions for market-side demand
- frozen forecast candidate package before S&OP acceptance

does_not_own:
- agreed enterprise plan
- final supply-capacity balancing decision
- executable MRP / CRP outputs
- BI dashboard projection truth

## 2.2 07.sop-consensus
canonical_role:
- agreed consensus demand / supply / capacity / inventory truth

owns_truth:
- consensus cycle
- scenario set for executive review
- demand / supply balancing result
- capacity compromise result
- inventory positioning agreement
- unresolved issue register
- accepted risk register
- executive freeze decision
- frozen consensus package handed to production planning

does_not_own:
- raw market forecast truth
- detailed executable shop-floor schedule truth
- BI KPI definition truth

## 2.3 16.production-planning
canonical_role:
- executable planning truth

owns_truth:
- master production planning package
- MPS level planning
- MRP result
- CRP result
- finite / infinite scheduling result
- planned order / supply proposal / replenishment proposal
- production planning exception
- feasible execution-oriented plan derived from frozen S&OP package

does_not_own:
- raw market forecast truth
- executive consensus truth
- BI projection truth
- manufacturing execution truth

## 2.4 15.manufacturing
reference_position:
- execution truth only
- included here only for boundary clarity

owns_truth:
- production execution
- work order execution
- actual output / scrap / downtime / completion

does_not_own:
- market forecast truth
- S&OP consensus truth
- planning truth
- BI projection truth

## 2.5 60.business-intelligence
canonical_role:
- analytical projection truth only

owns_truth:
- KPI definition canon
- dashboard projection canon
- dataset snapshot canon
- executive summary projection canon
- drill-down link canon
- analytical view composition
- metric rendering and aggregation logic for reporting

does_not_own:
- forecast truth
- consensus truth
- executable planning truth
- manufacturing execution truth
- audit finding truth
- approval truth

# ============================================================
# 3. TOP-LEVEL FLOW
# ============================================================

canonical_flow:
- 06.demand-forecasting
- -> 07.sop-consensus
- -> 16.production-planning
- -> 15.manufacturing

analytical_side_flow:
- 06 / 07 / 16 / 15
- -> dataset extraction / snapshot
- -> 60.business-intelligence projection

rules:
- 60 does not sit inline between 06 and 07
- 60 does not approve or mutate 06 / 07 / 16 / 15 truth
- 07 must consume 06 candidate package, not BI dashboard output as truth
- 16 must consume 07 frozen consensus package, not a BI summary page as truth

# ============================================================
# 4. HANDOFF CONTRACTS
# ============================================================

## 4.1 06 -> 07 handoff
handoff_name:
- forecast_candidate_handoff

minimum_contract:
- forecast_cycle_id
- forecast_version_id
- forecast_scope
- grain_definition
- forecast_quantity_set
- forecast_value_set if used
- assumptions
- confidence / accuracy reference
- override_trace
- promotion_adjustment_trace
- launch_adjustment_trace
- frozen_candidate_flag
- frozen_at
- frozen_by

rules:
- handoff package must be immutable after freeze
- post-freeze correction must create new forecast version
- manual override trace is mandatory
- 07 may accept or reject candidate, but may not rewrite 06 source truth in place

## 4.2 07 -> 16 handoff
handoff_name:
- consensus_plan_handoff

minimum_contract:
- sop_cycle_id
- consensus_version_id
- agreed demand set
- agreed supply policy set
- agreed capacity assumptions
- agreed inventory target / buffer policy
- unresolved_issue_register_reference
- accepted_risk_register_reference
- executive_decision_reference
- approved_freeze_flag
- approved_at
- approved_by

rules:
- approved freeze is immutable
- change after executive freeze must create a new consensus version
- accepted_risk trace is mandatory when unresolved issues remain
- 16 may derive executable plan, but may not mutate frozen consensus truth

## 4.3 16 -> 15 handoff
handoff_name:
- executable_plan_handoff

minimum_contract:
- planning_cycle_id
- executable_plan_version_id
- plant / line / work center scope
- time bucket / calendar basis
- planned order set
- capacity-feasible schedule set
- material feasibility result
- planning_exception_set
- release decision if applicable

rules:
- 15 executes released plan
- 15 actuals may feed back as performance input later
- 15 execution result must not back-edit 16 planning truth in place

# ============================================================
# 5. FREEZE / IMMUTABILITY RULES
# ============================================================

freeze_levels:
- 06 frozen_candidate
- 07 executive_approved_freeze
- 16 released_executable_plan

rules:
- frozen objects are immutable
- corrections require new version issuance
- lineage must remain queryable
- source and successor versions must be linkable
- override / accepted_risk / release rationale must remain traceable

required_traceability:
- who changed
- when changed
- why changed
- predecessor version
- successor version
- approval / acceptance reference where applicable

# ============================================================
# 6. CONFLICT AND EXCEPTION BOUNDARY
# ============================================================

06 exception examples:
- statistical forecast anomaly
- missing promotion master
- launch assumption uncertainty
- planner override conflict

07 exception examples:
- demand exceeds feasible capacity
- supply shortage unresolved
- inventory policy conflict
- executive decision deferred

16 exception examples:
- MRP infeasibility
- CRP overload
- schedule collision
- component availability gap

ownership_rule:
- 06 exceptions remain 06 truth until handed off
- 07 unresolved issues remain 07 truth
- 16 planning exceptions remain 16 truth
- 60 may visualize exception KPIs but does not own exception resolution truth

# ============================================================
# 7. BI BOUNDARY EXACT
# ============================================================

allowed_bi_inputs:
- approved or published data extracts from 06 / 07 / 16 / 15
- dataset snapshots
- KPI definitions
- drill-down references
- dimensional models for reporting

forbidden_bi_behavior:
- direct overwrite of source module truth
- substitute dashboard numbers as planning truth
- manual BI-side correction that bypasses source module workflow
- ownership of consensus decision or forecast versioning
- approval authority over 06 / 07 / 16

dataset_snapshot_rules:
- BI consumes snapshots or approved read models
- snapshot timestamp must be visible
- source module / source version must be traceable
- executive summary must declare snapshot basis
- late-arriving source corrections require new BI refresh or new snapshot, not silent overwrite

projection_rules:
- BI analytical projection is allowed
- BI what-if view is allowed
- BI scenario simulation is allowed only as analytical projection
- if simulation becomes business planning candidate, ownership must move into proper source module workflow
- BI scenario output cannot become 07 or 16 truth without formal re-entry through those modules

# ============================================================
# 8. COMMONOS BOUNDARY EXACT
# ============================================================

CommonOS_allowed:
- list / detail / form shell
- queue presentation
- sync state presentation
- dense ERP input variant
- common UI tokens / layout / presentation metadata

CommonOS_forbidden:
- forecast canon ownership
- consensus canon ownership
- planning canon ownership
- approval canon ownership
- inventory / costing / accounting canon ownership
- BI metric business meaning ownership

rule:
- CommonOS may present forecast queues, consensus review lists, planning exception lists,
  and BI dashboards, but meaning, state transition, and business truth remain in ERP modules.

# ============================================================
# 9. TOP-LEVEL OWNERSHIP MATRIX
# ============================================================

| concept | owner_module | note |
|---|---|---|
| raw market demand forecast | 06.demand-forecasting | source forecast truth |
| forecast override trace | 06.demand-forecasting | mandatory lineage |
| forecast candidate freeze | 06.demand-forecasting | handoff basis to 07 |
| agreed demand/supply/capacity/inventory | 07.sop-consensus | consensus truth |
| unresolved issue register | 07.sop-consensus | executive visibility |
| accepted risk register | 07.sop-consensus | mandatory when freezing with risk |
| executable planning package | 16.production-planning | planning truth |
| MRP / CRP / scheduling result | 16.production-planning | executable detail |
| shop-floor execution actuals | 15.manufacturing | execution truth |
| KPI definition canon | 60.business-intelligence | analytical truth |
| dataset snapshot canon | 60.business-intelligence | reporting basis |
| dashboard projection canon | 60.business-intelligence | presentation truth only |

# ============================================================
# 10. DECISION TESTS
# ============================================================

decision_tests:
- If the object answers "what does the market appear to need?" -> 06
- If the object answers "what did the enterprise agree to do?" -> 07
- If the object answers "what can be executed as a feasible plan?" -> 16
- If the object answers "what was actually executed?" -> 15
- If the object answers "how should we analyze / visualize / summarize it?" -> 60

# ============================================================
# 11. FOLLOW-ON DESIGN DIRECTIONS
# ============================================================

natural_next_steps:
- exact handoff payload design between 06 and 07
- exact handoff payload design between 07 and 16
- feedback loop memo from 15 actuals back to 06 / 07 / 16
- KPI and dataset snapshot lineage rules for 60
- cross-module status taxonomy for demand / consensus / planning lifecycle

completion_state:
- upper boundary fixed for 06 / 07 / 16 / 60
- source truth vs analytical projection separation fixed
- freeze / immutable / traceability rules fixed
- CommonOS presentation boundary clarified

# ============================================================
